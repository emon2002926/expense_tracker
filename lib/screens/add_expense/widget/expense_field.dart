import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ExpenseField extends StatelessWidget {
  final IconData iconData ;
  final String hintText ;
  final double? borderRadius ;
  final VoidCallback? onTap ;
  final bool readOnly;
  final TextEditingController? controller ;
  const ExpenseField({super.key, required this.iconData,  this.borderRadius, required this.hintText, this.onTap,  this.readOnly=false, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onTap: () => onTap!(),
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: Icon(iconData,size: 16,color: Colors.grey,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??12)),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16,color: Colors.grey),
        ),

    );
  }
}
