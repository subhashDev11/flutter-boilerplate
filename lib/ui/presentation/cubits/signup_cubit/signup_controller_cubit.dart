import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../modals/choose_picker_moal.dart';

part 'signup_controller_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit()
      : super(const SignUpState.init(
            obSecurePassword: true,
            visiblePassword: false,
            visibleConfirmPassword: false));

  final ImagePicker _picker = ImagePicker();

  String? validateName(String? value) {
    if (value == null) {
      return tr('name_required');
    } else if (value.isEmpty) {
      return tr('name_required');
    } else if (value.length < 2) {
      return "Invalid Name";
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (value == null) {
      return tr('email_required');
    }
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return tr('email_required');
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    String pattern =
        r'^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})';
    if (value == null) {
      return tr('password_required');
    }
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return tr('password_required');
    } else if (!regExp.hasMatch(value)) {
      return "Password should be contains character, special character and numeric value";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String? value) {
    String pattern =
        r'^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})';
    if (value == null) {
      return tr('confirm_password_required');
    }
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return tr('confirm_password_required');
    } else if (!regExp.hasMatch(value)) {
      return "Password should be contains character, special character and numeric value";
    } else if (state.password != state.confirmPassword) {
      return "Please Make Sure Password Match";
    } else {
      return null;
    }
  }

  void onNameChange(String? name) {
    emit(state.copyWith(name: name));
  }

  void onEmailChange(String? email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChange(String? password) {
    emit(state.copyWith(password: password));
  }

  void onConfirmPasswordChange(String? confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void changePasswordVisibility() {
    emit(state.copyWith(
      visiblePassword: !state.visiblePassword,
    ));
  }

  void changeConfirmPasswordVisibility() {
    emit(state.copyWith(
      visibleConfirmPassword: !state.visibleConfirmPassword,
    ));
  }

  void pickProfileImage(BuildContext context) async {
    final imageSource = await showChoosePickerModal(context);
    if (imageSource != null) {
      final pickedImage = await _picker.pickImage(source: imageSource);
      if (pickedImage?.path != null) {
        emit(state.copyWith(
          pickedProfilePic: File(pickedImage!.path),
        ));
      }
    }
  }
}
