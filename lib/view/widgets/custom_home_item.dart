import 'package:currency/utilities/app_colors.dart';
import 'package:currency/view/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomHomeItem extends StatelessWidget {
  final String? marketCapRank;
  final String? src;
  final String? name;
  final String? symbol;
  final String? currentPrice;
  final String? marketCap;
  final String? priceChangePercentage;

  const CustomHomeItem({Key? key, this.marketCapRank, this.src, this.name, this.symbol, this.currentPrice, this.marketCap, this.priceChangePercentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
          Expanded(
            child: Row(
                children: [
              DefaultText(text: marketCapRank!,fontWeight: FontWeight.w500,fontSize: 16),
              SizedBox(width: 1.w,),
              CircleAvatar(
                backgroundColor: Colors.grey,
                  radius: 25,
                  child: Image.network(src!,fit:BoxFit.cover ,)),
                  SizedBox(width: 3.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                DefaultText(text: name!,fontWeight: FontWeight.w500,fontSize: 14,),
                DefaultText(text: symbol!,fontSize: 12,fontWeight: FontWeight.w400,),
              ],)



            ]),
          ),

          Column(
            children: [
              DefaultText(text:currentPrice!),
              DefaultText(text:marketCap!),
              DefaultText(text:priceChangePercentage!),
            ],
          )
        ],
      ),


    );
  }
}
