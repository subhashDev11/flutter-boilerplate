// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:hyam_services/ui/presentation/screens/first_screen.dart' as _i2;
import 'package:hyam_services/ui/presentation/screens/signin_screen.dart'
    as _i3;
import 'package:hyam_services/ui/presentation/screens/signup_screen.dart'
    as _i4;
import 'package:hyam_services/ui/presentation/screens/splash_screen.dart'
    as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    DashboardScreen.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.DashboardScreen(),
          opaque: true,
          barrierDismissible: false);
    },
    SignInScreen.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.SignInScreen());
    },
    SignUpScreen.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.SignUpScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashScreen.name, path: '/'),
        _i5.RouteConfig(DashboardScreen.name, path: '/dashboard-screen'),
        _i5.RouteConfig(SignInScreen.name, path: '/sign-in-screen'),
        _i5.RouteConfig(SignUpScreen.name, path: '/sign-up-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i5.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardScreen extends _i5.PageRouteInfo<void> {
  const DashboardScreen()
      : super(DashboardScreen.name, path: '/dashboard-screen');

  static const String name = 'DashboardScreen';
}

/// generated route for
/// [_i3.SignInScreen]
class SignInScreen extends _i5.PageRouteInfo<void> {
  const SignInScreen() : super(SignInScreen.name, path: '/sign-in-screen');

  static const String name = 'SignInScreen';
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpScreen extends _i5.PageRouteInfo<void> {
  const SignUpScreen() : super(SignUpScreen.name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}
