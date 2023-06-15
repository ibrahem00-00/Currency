import 'package:currency/utilities/app_colors.dart';
import 'package:currency/view/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_string.dart';

class CustomSearchItem extends StatelessWidget {
  final String? marketCapRank;
  final String? src;
  final String? name;
  final String? symbol;

  const CustomSearchItem({Key? key, this.marketCapRank, this.src, this.name, this.symbol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 12.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            CircleAvatar(
                radius: 20,
                child: Image.network(src!,fit: BoxFit.cover,)),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              DefaultText(text: name!,maxLines: 2,overflow: TextOverflow.ellipsis,fontSize: 10.sp,),
              DefaultText(text: symbol!,fontSize: 12.sp,),
            ],)



          ]),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              const DefaultText(text:AppStrings.rank),
              DefaultText(text: marketCapRank!),

            ],
          )
        ],
      ),


    );
  }
}
