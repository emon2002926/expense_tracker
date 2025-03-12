import 'dart:math';

import 'package:expense_tracker/util/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.yellow[700]),
                      ),
                      Icon(
                        CupertinoIcons.person_fill,
                        color: CustomColors.outline,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.outline),
                      ),
                      Text(
                        "Md Emon",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],

              ),
              IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.settings))

            ],
          ),
        SizedBox(height: 20,),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width/2,

          decoration: BoxDecoration(

            gradient: LinearGradient(colors:[
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,],
                transform: GradientRotation(pi / 4)),
              borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                offset: Offset(5, 5)
              )
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Total balance",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white
              ),),
              SizedBox(height: 12),
              Text("\$5000",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white
                ),),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
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
                            child: Icon(CupertinoIcons.arrow_down,size: 14,
                            color: Colors.greenAccent,),

                          ),
                        ),
                        SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Income",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white
                              ),),
                            Text("\$2500",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white
                              ),),
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
                            child: Icon(CupertinoIcons.arrow_down,size: 14,
                            color: Colors.redAccent,),

                          ),
                        ),
                        SizedBox(width: 8,),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Expense",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white
                                ),),
                              Text("\$1800",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white
                                ),),
                            ])
                      ],
                    )

                  ],

                ),
              )
            ],
          ),
        )

        ],
      ),
    ));
  }
}
