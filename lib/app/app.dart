import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyam_services/locator.dart';
import '../cubit/theme_cubit.dart';
import '../router/app_routes.gr.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final router = getItInjector<AppRouter>();
        return MaterialApp.router(
          title: 'Hyam Services',
          theme: state.themeData,
          routerDelegate: AutoRouterDelegate(
            router,
            navigatorObservers: () => [],
          ),
          routeInformationParser: router.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}
