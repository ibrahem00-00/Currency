import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultTextButton extends StatelessWidget {
  final String mainTxt;
  final String secondaryTxt;
  final void Function()? onPressed;
  final Color? mainTxtColor;
  final Color? secondaryTxtColor;
  final double? mainTxtSize;
  final double? secondaryTxtSize;

  const DefaultTextButton({Key? key,
    required this.mainTxt,
    required this.secondaryTxt,
    required this.onPressed,
    this.mainTxtColor,
    this.secondaryTxtColor,
    this.mainTxtSize,
    this.secondaryTxtSize,

  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          mainTxt,
          style: TextStyle(
              color: mainTxtColor,
              fontSize: 16.sp,),
        ),
        TextButton(onPressed: onPressed,
            child: Text(secondaryTxt,
              style:  TextStyle(color:secondaryTxtColor , fontSize:secondaryTxtSize),))
      ],
    );
  }
}
