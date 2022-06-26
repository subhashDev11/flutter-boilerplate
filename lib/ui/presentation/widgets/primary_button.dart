import 'package:flutter/material.dart';

import '../../../styles/text_styles.dart';
import '../../../utils/typedef.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.disable})
      : super(key: key);
  final VoidFunctionCallbackWithNoParam onTap;
  final String title;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: !disable ? onTap : null,
      child: Opacity(
        opacity: disable ? 0.5 : 1,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              theme.primaryColor,
              Colors.green.shade400,
            ]),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyles.primaryButtonContent,
            ),
          ),
        ),
      ),
    );
  }
}
