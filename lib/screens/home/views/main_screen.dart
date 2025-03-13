import 'dart:math';
import 'package:expense_tracker/data/data.dart';
import 'package:expense_tracker/screens/home/widget/genaral_textview.dart';
import 'package:expense_tracker/util/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/transaction_data.dart';

// import '../widget/transaction_data.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
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
                              shape: BoxShape.circle,
                              color: Colors.yellow[700]),
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
                        GeneralTextview(
                          text: "Welcome",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        GeneralTextview(
                          text: "Md Emon",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        )
                      ],
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(CupertinoIcons.settings))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
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
            ),
            SizedBox(
              height: 40,
            ),
            Row(
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
                    color: Theme.of(context).colorScheme.outline,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),

            ///Expense list
            TransactionData(
              transactionsData: transactionsList,
            )
          ],
        ),
      ),
    ));
  }
}
