import 'package:expense_tracker/screens/add_expense/bloc/get_categorybloc/get_category_bloc.dart';
import 'package:expense_tracker/screens/add_expense/widget/category_creation.dart';
import 'package:expense_tracker/screens/add_expense/widget/expense_field.dart';
import 'package:expense_tracker/screens/home/widget/genaral_textview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  child: ExpenseField(prefixIcon: FontAwesomeIcons.dollarSign,borderRadius: 30,hintText: "",controller: expenseController,),
                ),
                const SizedBox(height: 32,),
                // Todo Expense Category Field
                TextFormField(
                  controller: categoryController,
                  textAlign: TextAlign.center,
                  readOnly: true,
                  onTap: (){},
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(FontAwesomeIcons.list,size: 16,color: Colors.grey,),
                    suffixIcon: IconButton(onPressed: ()
                    {
                      getCategoryCreation(context);

                    }, icon: Icon(FontAwesomeIcons.add,size: 16,color: Colors.grey,)),
                    hintText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      borderSide: BorderSide.none
                    )
                )

                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocBuilder<GetCategoryBloc, GetCategoryState>(
                    builder: (context, state) {
                      //Todo it dose not show the data from database
                      if(state is GetCategorySuccess){
                        return ListView.builder(
                            itemCount:state.categories.length,
                            itemBuilder: (context,int i){

                              return Card(
                                child: ListTile(
                                  title: Text(state.categories[i].name),
                                  leading: Image.asset("assets/icons/${state.categories[i].icon}",scale: 20,),
                                  tileColor: Colors.red,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                              );
                            });
                      }
                      else if (state is GetCategoryLoading){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      else if(state is GetCategoryFailure){
                        return Text("Failed to get data form database try again later");
                      }else{
                        return Text("Check your internet connection");
                      }

                    },
                  ),
                                    ),
                ),
                //Todo date field
                const SizedBox(height: 32,),
                ExpenseField(prefixIcon: FontAwesomeIcons.clock,readOnly: true,
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
                    child: TextButton(onPressed: () {
                    },style: TextButton.styleFrom(
                        backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                        child: Text("Save",style: TextStyle(color: Colors.white),))
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
