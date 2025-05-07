import 'package:expense_repositories/src/repository/expense/expense_repository.dart' ;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../util/app_colors.dart';
import 'genaral_textview.dart';

class TransactionData extends StatelessWidget {
  final List<Expense>? transactionsList;

  const TransactionData({super.key, required this.transactionsList});


  @override
  Widget build(BuildContext context) {
    return Expanded( // Expand the ListView inside the Column
      child: ListView.builder(
        itemCount: transactionsList!.length,
        itemBuilder: (context, int i) {
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
                            color: Color(transactionsList![i].category.color),
                            shape: BoxShape.circle,
                          ),
                          child:  Image.asset(
                            "assets/icons/${transactionsList?[i].category.icon}.png", scale: 20,color: Colors.white,),
                        ),
                        SizedBox(width: 20),
                        GeneralTextview(
                          text: transactionsList![i].category.name,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GeneralTextview(
                          text: "\$${transactionsList![i].amount.toString()}",
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                        GeneralTextview(
                          text: DateFormat("dd/MM/yyyy").format(transactionsList![i].dateTime),
                          fontSize: 16,
                          color: CustomColors.outline,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
