import 'package:expense_tracker/screens/add_expense/widget/expense_field.dart';
import 'package:expense_tracker/screens/home/widget/genaral_textview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController expenseController=TextEditingController();
  TextEditingController categoryController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  DateTime selectedDate=DateTime.now();


  @override
  void initState() {
    // TODO: implement initState
    dateController.text= DateFormat('EEE, d/ M/ y').format(DateTime.now());
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Focus.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],

        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 GeneralTextview(text: "Add Expense",color: Colors.grey[800],
                  fontSize: 22,fontWeight: FontWeight.w500,),
                const SizedBox(height: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.7,
                  child: ExpenseField(iconData: FontAwesomeIcons.dollarSign,borderRadius: 30,hintText: "",controller: expenseController,),
                ),
                const SizedBox(height: 32,),
                ExpenseField(iconData: FontAwesomeIcons.list,hintText: "Category",controller: categoryController,),
                const SizedBox(height: 32,),
                ExpenseField(iconData: FontAwesomeIcons.clock,readOnly: true,
                  hintText: "Date",controller: dateController,
                  onTap:()async{
                    DateTime? newDate= await showDatePicker(context: context,
                        firstDate: DateTime.now(),initialDate: selectedDate
                        , lastDate: DateTime.now().add(Duration(days:365)));
                    if(newDate!=null){
                      setState(() {
                        dateController.text=DateFormat('EEE, d/ M/ y').format(newDate);
                        selectedDate = newDate;
                      });
                    }
                  },

                ),
                const SizedBox(height: 32,),

                SizedBox(width: double.infinity,height: kToolbarHeight,
                    child: TextButton(onPressed: (){},style: TextButton.styleFrom(
                        backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                        child: Text("Save",style: TextStyle(color: Colors.white),))
                )],
            ),
          ),
        ),
      ),
    );
  }
}
