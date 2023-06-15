import 'package:currency/utilities/app_string.dart';
import 'package:currency/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utilities/app_colors.dart';
import '../../view model/database/local/cache_helper.dart';
import '../widgets/default_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const DefaultText(text:AppStrings.cryptoCurrency,color: AppColors.primaryColor,fontWeight: FontWeight.w600,fontSize: 30,),
          // Image.asset("images/splash.png",
          //   height: MediaQuery.of(context).size.height / 8,
          //   width: MediaQuery.of(context).size.width / 1.5,
          //   fit: BoxFit.cover,
          // ),

          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearPercentIndicator(
              animation: true,
              lineHeight: 7.0,
              animationDuration: 2000,
              percent: 1,
              barRadius: const Radius.circular(50),
              progressColor: AppColors.primaryColor,
              onAnimationEnd: () {
                if(CacheHelper.get(key: "logged")==true){
                  Navigator.popAndPushNamed(context, AppRoutes.homeScreenRoute);
                }else {
                  Navigator.popAndPushNamed(context, AppRoutes.loginScreenRoute);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
