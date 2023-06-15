import 'package:currency/utilities/routes.dart';
import 'package:currency/view/pages/auth/signup_screen.dart';
import 'package:currency/view/pages/home_screen.dart';
import 'package:currency/view/pages/profile_screen.dart';
import 'package:flutter/material.dart';

import '../view/pages/auth/login_screen.dart';
import '../view/pages/details_screen.dart';
import '../view/pages/splash_screen.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.registerScreenRoute:
      return MaterialPageRoute(builder:
          (context) => const SignupScreen(),
          settings: routeSettings
      );
    case AppRoutes.homeScreenRoute:
      return MaterialPageRoute(builder:
          (context) => const HomeLayout(),
          settings: routeSettings
      );
    case AppRoutes.detailsScreenRoute:
      return MaterialPageRoute(builder:
          (context) =>  DetailsScreen(),
          settings: routeSettings
      );
    case AppRoutes.profileScreenRoute:
      return MaterialPageRoute(builder:
          (context) =>  ProfileScreen(),
          settings: routeSettings
      );
    case AppRoutes.loginScreenRoute:
      return MaterialPageRoute(builder:
          (context) => const LoginScreen(),
        settings: routeSettings,

      );
    case AppRoutes.splashScreenRoute:
    default :
      return MaterialPageRoute(builder:
          (context) => const SplashScreen(),
        settings: routeSettings,

      );
  }
}