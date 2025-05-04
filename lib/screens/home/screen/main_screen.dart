import 'package:expense_repositories/expense_repository.dart';
import 'package:expense_tracker/data/data.dart';
import 'package:expense_tracker/screens/home/bloc/get_expense_bloc/get_expense_bloc.dart';
import 'package:expense_tracker/screens/home/bloc/get_expense_bloc/get_expense_bloc.dart';
import 'package:expense_tracker/screens/home/widget/genaral_textview.dart';
import 'package:expense_tracker/screens/home/widget/welcome_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/total_balance_widget.dart';
import '../widget/transaction_data.dart';

// import '../widget/transaction_data.dart';
class MainScreen extends StatelessWidget {


  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExpenseBloc, GetExpenseState>(
      builder: (context, state) {
        if(state is GetExpenseLoading){
          return Center(child: CircularProgressIndicator(),);
        }
        else if (state is GetExpenseSuccess) {
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
                    transactionText(context),
                    SizedBox(height: 20),

                    ///Expense list
                    TransactionData(transactionsList: state.expenses)
                  ],
                ),
              ),
            ));
        } else if(state is GetExpenseFailure){
          return Center(child: Text("Something went wrong"));
        }else{
          return Center(child: Text("Check your internet connection"),);
        }

        },
    );
  }

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
}
