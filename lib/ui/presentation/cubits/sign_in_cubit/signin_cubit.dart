import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hyam_services/data/repository/app_repository.dart';
import 'package:hyam_services/locator.dart';
import 'package:hyam_services/router/app_routes.gr.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../data/models/guard/user_model.dart';

part 'signin_state.dart';

class SignInCubit extends HydratedCubit<SignInState> {
  SignInCubit()
      : super(const SignInState(isLoggedIn: false, isProcessing: false));

  final appRepository = getItInjector<AppRepository>();
  final appRouter = getItInjector<AppRouter>();

  void loginFunc() async {
    emit(state.copyWith(isProcessing: true));
    final loginRes = await appRepository.login(
      email: state.email ?? '',
      password: state.password ?? '',
    );
    loginRes.fold(
      (l) {
        error(l.message);
      },
      (r) {
        if (r != null) {
          success(r);
          return;
        }
        error('Failed to login');
      },
    );
  }

  void error(String? failure) {
    emit(state.copyWith(
      isProcessing: false,
      isLoggedIn: false,
    ));
    ScaffoldMessenger.of(appRouter.navigatorKey.currentContext!)
        .showSnackBar(SnackBar(
      content: Text(
        failure ?? 'Failed to Login!',
      ),
      action: SnackBarAction(label: 'OK', onPressed: () {}),
    ));
  }

  void success(User r) async {
    await appRepository.setUserSessionData(user: r);
    emit(state.copyWith(
      isProcessing: false,
      isLoggedIn: true,
      user: r,
    ));
    ScaffoldMessenger.of(appRouter.navigatorKey.currentContext!)
        .showSnackBar(SnackBar(
      content: const Text(
        'Login Success!',
      ),
      action: SnackBarAction(label: 'OK', onPressed: () {}),
    ));
  }

  void isLoggedIn() async {
    emit(state.copyWith(isProcessing: true));
    final loginRes = await appRepository.getUserSessionData();
    loginRes.fold(
      (l) => {
        emit(state.copyWith(
          isProcessing: false,
          isLoggedIn: false,
        ))
      },
      (r) => {
        emit(state.copyWith(
          isProcessing: false,
          isLoggedIn: true,
        )),
      },
    );
  }

  void logoutSession() async {
    final logout = await appRepository.deleteUserSessionData();
    logout.fold((l) => {}, (r) {
      emit(state.copyWith(
        isLoggedIn: false,
      ));
      appRouter.replaceNamed('/sign-in-screen');
    });
  }

  void onEmailInputChanged(String? value){
    emit(state.copyWith(email: value));
  }


  void onPasswordInputChanged(String? value){
    emit(state.copyWith(password: value));
  }


  @override
  SignInState? fromJson(Map<String, dynamic> json) {
    return SignInState(
        isLoggedIn: json['isLoggedIn'] as bool, isProcessing: false);
  }

  @override
  Map<String, dynamic>? toJson(SignInState state) {
    return {
      'isLoggedIn': state.isLoggedIn,
    };
  }
}
