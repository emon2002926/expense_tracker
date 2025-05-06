
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'genaral_textview.dart';

Widget transactionText(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GeneralTextview(
        text: "Transactions",
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey[800],
      ),
      GestureDetector(
        onTap: () {},
        child: GeneralTextview(
          text: "See all",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Theme
              .of(context)
              .colorScheme
              .outline,
        ),
      )
    ],
  );
}