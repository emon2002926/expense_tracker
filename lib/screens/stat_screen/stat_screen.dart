import 'package:expense_tracker/screens/home/widget/chart.dart';
import 'package:expense_tracker/util/app_colors.dart';
import 'package:flutter/material.dart';

import '../home/widget/genaral_textview.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralTextview(text: "Statistics",fontSize: 24,color: Colors.grey[900],fontWeight: FontWeight.bold,),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: MyChart(),
              )

              ],
          ),
        ));
  }
}
