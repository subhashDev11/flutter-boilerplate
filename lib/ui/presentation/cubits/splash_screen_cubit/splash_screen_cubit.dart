import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hyam_services/data/repository/app_repository.dart';
import '../../../../locator.dart';
import '../../../../router/app_routes.gr.dart';
part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());

  void init() async{
    final router = getItInjector<AppRouter>();
    await Future.delayed(const Duration(microseconds: 100));
    final response = await getItInjector<AppRepository>().getUserSessionData();
    response.fold((l) {
      router.replaceNamed('/sign-in-screen');
    }, (r) {
      if(r!=null){
        router.replaceNamed('/dashboard-screen');
      }else{
        router.replaceNamed('/sign-in-screen');
      }
    });
  }
}
