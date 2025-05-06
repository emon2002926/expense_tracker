import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ExpenseField extends StatelessWidget {
  final IconData? prefixIcon ;
  final IconData? suffixIcon ;
  final String hintText ;
  final double? borderRadius ;
  final VoidCallback? onTap ;
  final bool readOnly;
  final double? suffixIconSize ;
  final TextEditingController? controller ;
  final Color? fillColor ;
  final TextInputType? textInputType ;
  const ExpenseField({super.key,  this.prefixIcon,  this.borderRadius
    , required this.hintText, this.onTap,  this.readOnly=false, this.controller,this.suffixIcon,this.suffixIconSize=16, this.fillColor=Colors.white, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onTap: () => onTap!(),
        readOnly: readOnly,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          fillColor:fillColor,
          filled: true,
          prefixIcon: Icon(prefixIcon,size: 16,color: Colors.grey,),
          suffixIcon: Icon(suffixIcon,size: suffixIconSize,color: Colors.grey,),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??12)),
            borderSide: BorderSide.none
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16,color: Colors.grey),


        ),

    );
  }
}
