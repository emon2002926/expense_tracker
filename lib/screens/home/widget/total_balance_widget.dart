import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'genaral_textview.dart';
class TotalBalanceWidget extends StatelessWidget {
  const TotalBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.tertiary,
          ], transform: GradientRotation(pi / 4)),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                offset: Offset(5, 5))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GeneralTextview(
            text: "Total balance",
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 12),
          GeneralTextview(
            text: "\$5000",
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white30,
                      ),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.arrow_down,
                          size: 14,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GeneralTextview(text: "Income"),
                          GeneralTextview(
                            text: "\$2500",
                            fontWeight: FontWeight.w600,
                          ),
                        ])
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white30,
                      ),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.arrow_down,
                          size: 14,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GeneralTextview(
                            text: 'Expense',
                          ),
                          GeneralTextview(
                            text: "\$1800",
                            fontWeight: FontWeight.w600,
                          )
                        ])
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

  }
}

