import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import 'default_text.dart';

class CustomNavBarItem extends StatelessWidget {
  final String txt;

  const CustomNavBarItem({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  [
        DefaultText(text: txt,color: AppColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w500,),
        const SizedBox(height: 5,),
        const CircleAvatar(backgroundColor: AppColors.primaryColor,radius: 3.8,)
      ],) ;
  }
}
