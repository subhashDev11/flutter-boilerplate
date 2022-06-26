import 'package:auto_route/annotations.dart';
import 'package:hyam_services/ui/presentation/screens/signin_screen.dart';
import 'package:hyam_services/ui/presentation/screens/signup_screen.dart';

import '../ui/presentation/screens/first_screen.dart';
import '../ui/presentation/screens/splash_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
        page: SplashScreen,
        initial: true,
    ),
    CustomRoute(
        page: DashboardScreen,
    ),
    AutoRoute(
        page: SignInScreen,
    ),
    AutoRoute(
      page: SignUpScreen,
    ),

  ],
)
class $AppRouter {}
