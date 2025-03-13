import 'package:flutter/material.dart';
class GeneralTextview extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const GeneralTextview({super.key, required this.text,  this.fontSize,this.fontWeight,this.color});


  @override
  Widget build(BuildContext context) {

    return  Container(
      child:
      Text(text,
        style: TextStyle(
            fontWeight: fontWeight??FontWeight.w400,
            fontSize:fontSize??14,
            color:color?? Colors.white
        ),),
    );
  }
}
