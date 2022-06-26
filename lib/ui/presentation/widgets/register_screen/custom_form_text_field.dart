import 'package:flutter/material.dart';

import '../../../../utils/typedef.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.validationCallback,
    required this.onChangedCallback,
    this.onSavedCallback,
    required this.onSubmitCallback,
    required this.hintText,
    required this.isLast,
    this.obSecurePassword,
    this.controller,
    this.suffixIcon,
  }) : super(key: key);
  final FunctionCallbackWithParam validationCallback;
  final VoidFunctionCallback? onSavedCallback;
  final VoidFunctionCallback? onSubmitCallback;
  final VoidFunctionCallback onChangedCallback;
  final String hintText;
  final bool? obSecurePassword;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: controller,
        obscureText: obSecurePassword ?? false,
        decoration: InputDecoration(
            label: Text(
              hintText,
              style:  const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            suffixIcon: suffixIcon,
        ),
        validator: validationCallback,
        onSaved: onSavedCallback,
        onChanged: onChangedCallback,
        onFieldSubmitted: onSubmitCallback,
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
      ),
    );
  }
}
