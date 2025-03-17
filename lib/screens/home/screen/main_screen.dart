import 'package:expense_tracker/data/data.dart';
import 'package:expense_tracker/screens/home/widget/genaral_textview.dart';
import 'package:expense_tracker/screens/home/widget/welcome_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/total_balance_widget.dart';
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
            WelcomeTab(name: "Md Emon",),
            SizedBox(height: 20,),
            TotalBalanceWidget(),
            SizedBox(height: 40,),
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
            SizedBox(height: 20),
            ///Expense list
            TransactionData(transactionsData: transactionsList)
          ],
        ),
      ),
    ));
  }
}
