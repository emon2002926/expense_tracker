import 'package:expense_tracker/screens/stat_screen/widget/chart.dart';
import 'package:flutter/material.dart';
import '../home/widget/genaral_textview.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Container(
          color: Colors.grey[100],
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12,20,12,12),
                    child: MyChart(),
                  ),
                )

                ],
            ),
          ),
        ));
  }
}
