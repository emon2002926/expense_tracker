import 'package:flutter/material.dart';

import '../../../util/app_colors.dart';
import 'genaral_textview.dart';
class TransactionData extends StatelessWidget {
  final List<Map<String,dynamic>> transactionsData;
  const TransactionData({super.key, required this.transactionsData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemCount: transactionsData.length,
          itemBuilder: (context, int i){
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      Row(
                        children: [

                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: transactionsData[i]["color"],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(transactionsData[i]["icon"],color: Colors.white,),
                          ),
                          SizedBox(width: 20,),
                          GeneralTextview(text: transactionsData[i]["name"] ,fontSize: 16,
                            fontWeight: FontWeight.w600,color: Colors.grey[800],),
                          SizedBox(width: 20,),

                        ],
                      ),
                      Column(
                        children: [
                          GeneralTextview(text: transactionsData[i]["totalAmount"],fontSize: 16,color: Colors.grey[800],),
                          GeneralTextview(text: "Today",fontSize: 16,color: CustomColors.outline,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
