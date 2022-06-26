
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/image_constants.dart';
import '../cubits/splash_screen_cubit/splash_screen_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashScreenCubit splashScreenCubit;

  @override
  void initState() {
    // TODO: implement initState
    splashScreenCubit = context.read<SplashScreenCubit>()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.dstATop),
                image: AssetImage(
                  ImageConstant.splashBackground,
                ),
              ),
            ),
            child: Center(
              child: Image.asset(ImageConstant.appLogo),
            ),
          ),
        ),
      );
    });
  }
}
