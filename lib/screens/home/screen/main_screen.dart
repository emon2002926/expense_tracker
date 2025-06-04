import 'package:expense_tracker/screens/home/bloc/get_expense_bloc/get_expense_bloc.dart';
import 'package:expense_tracker/screens/home/bloc/user_finance/user_finance_bloc.dart';
import 'package:expense_tracker/screens/home/bloc/user_profile/user_bloc.dart';
import 'package:expense_tracker/screens/home/widget/welcome_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_repositories/src/repository/user_finance/finance_repo.dart' ;


import '../widget/total_balance_widget.dart';
import '../widget/transaction_data.dart';
import '../widget/transaction_header.dart';

// import '../widget/transaction_data.dart';
class MainScreen extends StatelessWidget {
  final String uid;

  const MainScreen({super.key, required this.uid,});

  @override
  Widget build(BuildContext context) {
    print("uid12:$uid");
    return SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoaded) {
                      return WelcomeTab(name: state.user.username,);
                    } else {
                      return WelcomeTab(name: "FFF",);
                    }
                  },
                ),
                SizedBox(height: 20,),
                //Todo add transaction header
              TotalBalanceWidget(uid: uid),
                SizedBox(height: 40,),
                transactionText(context),
                SizedBox(height: 20),

                ///Expense list
                BlocBuilder<GetExpenseBloc, GetExpenseState>(
                  builder: (context, state) {
                    if (state is GetExpenseSuccess) {
                      return TransactionData(transactionsList: state.expenses);
                    } else {
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}


