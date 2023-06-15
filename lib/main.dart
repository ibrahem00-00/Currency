import 'package:currency/utilities/router.dart';
import 'package:currency/utilities/routes.dart';
import 'package:currency/utilities/themes.dart';
import 'package:currency/view%20model/auth/login/login_cubit.dart';
import 'package:currency/view%20model/auth/sign_out/sign_out_cubit.dart';
import 'package:currency/view%20model/auth/signup/signup_cubit.dart';
import 'package:currency/view%20model/database/local/cache_helper.dart';
import 'package:currency/view%20model/main/details/details_cubit.dart';
import 'package:currency/view%20model/main/home/home_cubit.dart';
import 'package:currency/view%20model/main/home_layout/home_layout_cubit.dart';
import 'package:currency/view%20model/main/profile/image_pick/image_pick_cubit.dart';
import 'package:currency/view%20model/main/search/search_cubit.dart';
import 'package:currency/view%20model/main/theme/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MultiProvider(

          providers: [
            BlocProvider(
              create: (context) => HomeCubit(),
            ),
            BlocProvider(
              create: (context) => SearchCubit(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
            BlocProvider(
              create: (context) => SignupCubit(),
            ),
            BlocProvider(
              create: (context) => HomeLayoutCubit(),
            ),
            BlocProvider(
              create: (context) => SignOutCubit(),
            ),
            BlocProvider(
              create: (context) => DetailsCubit(),
            ),
            BlocProvider(
              create: (context) => ImagePickCubit(),
            ),
            BlocProvider(
              create: (context) => ThemeCubit(),
            )
          ],
          child: BlocConsumer<ThemeCubit, ThemeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return MaterialApp(
                theme: Themes.lightTheme,
                darkTheme: Themes.darkTheme,
                themeMode: context
                    .read<ThemeCubit>()
                    .themeMode,
                debugShowCheckedModeBanner: false,
                // home: SignupScreen(),
                onGenerateRoute: onGenerate,
                initialRoute: AppRoutes.splashScreenRoute,
              );
            },
          ),
        );
      },
    );
  }
}
