import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../add_expense/widget/expense_field.dart';
import '../bloc/user_finance/user_finance_bloc.dart';
import 'genaral_textview.dart';
import 'package:expense_repositories/src/repository/user_finance/finance_repo.dart' ;



class TotalBalanceWidget extends StatelessWidget {
  // final double totalBalance;
  final String uid;
  const TotalBalanceWidget({super.key, required this.uid, });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextEditingController categoryTotalBalanceController=TextEditingController();
    TextEditingController categoryIncomeController=TextEditingController();
    TextEditingController categoryExpenseController=TextEditingController();

    late UserFinanceEntity finance;
    return BlocBuilder<UserFinanceBloc, UserFinanceState>(
      builder: (context, state) {
        if (state is UserFinanceLoaded) {
          finance = state.finance;
        }else if(state is UserFinanceError){
          finance = UserFinanceEntity.empty();
        }else{
          finance = UserFinanceEntity.empty();
        }

        return Container(
          width: size.width,
          height: size.width / 1.9,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.tertiary,
              ],
              transform: GradientRotation(pi / 4),
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Row: Title + Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const GeneralTextview(
                      text: "Total balance",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(context: context, builder: (ctx){
                          return AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Colors.blue[50], // Set your desired color here
                              title: const Text("Add Category"),
                            content: Container(
                              height: 300,
                              child: Column(
                                children: [
                                  ExpenseField(borderRadius: 12,
                                      hintText: "Total Balance",
                                      textInputType: TextInputType.number,
                                      controller: categoryTotalBalanceController),
                                  SizedBox(height: 10,),
                                  ExpenseField(borderRadius: 12,
                                      hintText: "income",
                                      textInputType: TextInputType.number,
                                      controller: categoryIncomeController),
                                  SizedBox(height: 10,),
                                  ExpenseField(borderRadius: 12,
                                      hintText: "expense",
                                      textInputType: TextInputType.number,
                                      controller: categoryExpenseController),

                                  SizedBox(height: 15,),
                                  SizedBox(width: double.infinity, height: kToolbarHeight,
                                      child: TextButton(
                                          onPressed: () {
                                            //todo save category button
                                            final initialFinance = UserFinanceEntity(
                                              uid: uid,
                                              totalBalance: 0,
                                              income: 0,
                                              expense: 0,
                                            );

                                            context.read<UserFinanceBloc>().add(
                                              CreateUserFinance( uid,  initialFinance),
                                            );

                                          },
                                          style: TextButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12))),
                                          child: Text(
                                            "Save", style: TextStyle(color: Colors.white),))
                                  )
                                ]
                              )

                            )
                          );
                        });
                      },
                      icon: const Icon(
                        CupertinoIcons.add_circled_solid,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                // Middle: Balance Amount
                 GeneralTextview(
                  text: "\$ ${finance.totalBalance.toString()}",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),

                // Bottom: Income and Expense
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Income
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
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
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            GeneralTextview(text: "Income"),
                            GeneralTextview(
                              text: "\$ ${finance.income.toString()}",
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Expense
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
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
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            GeneralTextview(text: "Expense"),
                            GeneralTextview(
                              text: "\$ ${finance.expense.toString()}",
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
      );
  },
);

  }

}
