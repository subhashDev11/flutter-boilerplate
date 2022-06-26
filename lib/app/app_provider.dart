import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyam_services/app/app.dart';
import 'package:hyam_services/cubit/bottom_nav_cubit.dart';
import 'package:hyam_services/ui/presentation/cubits/splash_screen_cubit/splash_screen_cubit.dart';

import '../cubit/theme_cubit.dart';
import '../ui/presentation/cubits/sign_in_cubit/signin_cubit.dart';
import '../ui/presentation/cubits/signup_cubit/signup_controller_cubit.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(),
        ),
        BlocProvider<SplashScreenCubit>(
          create: (context) => SplashScreenCubit(),
        ),
        BlocProvider<BottomNavCubit>(
          create: (context) => BottomNavCubit(),
        ),


      ],
      child: const App(),
    );
  }
}
