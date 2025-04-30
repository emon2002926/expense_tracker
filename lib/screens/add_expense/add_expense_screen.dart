import 'package:expense_repositories/expense_repository.dart';
import 'package:expense_tracker/screens/add_expense/bloc/get_categorybloc/get_category_bloc.dart';
import 'package:expense_tracker/screens/add_expense/widget/category_creation.dart';
import 'package:expense_tracker/screens/add_expense/widget/expense_field.dart';
import 'package:expense_tracker/screens/home/widget/genaral_textview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'bloc/create_expensebloc/create_expense_bloc.dart';
class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController expenseController=TextEditingController();
  TextEditingController categoryController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  // DateTime selectedDate=DateTime.now();
  late Expense expense;
  bool isLoading=false;

  @override
  void initState() {
    // TODO: implement initState
    dateController.text= DateFormat('EEE, d/ M/ y').format(DateTime.now());
    expense=Expense.empty;
    expense.expenseId = const Uuid().v1();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateExpenseBloc, CreateExpenseState>(
      listener: (context, state) {

        if(state is CreateExpenseSuccess){
          Navigator.pop(context);
        }else if(state is CreateExpenseLoading){
          setState(() {
            isLoading=true;
          });
        }

      },

      child: GestureDetector(
        onTap: ()=> Focus.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.grey[100],

          ),
          body: BlocBuilder<GetCategoryBloc, GetCategoryState>(

          builder: (context, state) {

            if(state is GetCategorySuccess) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GeneralTextview(
                        text: "Add Expense", color: Colors.grey[800],
                        fontSize: 22, fontWeight: FontWeight.w500,),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .7,
                        child: ExpenseField(prefixIcon: FontAwesomeIcons
                            .dollarSign,
                          borderRadius: 30,
                          hintText: "",
                          controller: expenseController,),
                      ),
                      const SizedBox(height: 32,),
                      // Todo Expense Category Field
                      TextFormField(
                          controller: categoryController,
                          textAlign: TextAlign.center,
                          readOnly: true,
                          onTap: () {},
                          decoration: InputDecoration(
                              filled: true,
                              fillColor:expense.category==Category.empty? Colors.white: Color(expense.category.color),

                              prefixIcon:expense.category==Category.empty?
                              Icon(FontAwesomeIcons.list, size: 16,
                                color: Colors.grey,)
                              :Image.asset("assets/icons/${expense.category.icon}.png",scale: 20,),

                              suffixIcon: IconButton(onPressed: () async {
                                var newCategory = await getCategoryCreation(context);
                                setState(() {
                                  state.categories.insert(0, newCategory);

                                });

                                //print(newCategory);

                                },
                                  icon: Icon(FontAwesomeIcons.add, size: 16,
                                    color: Colors.grey,)),
                              hintText: "Category",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  borderSide: BorderSide.none
                              )
                          )

                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(12))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: state.categories.length,
                            itemBuilder: (context, int i) {
                              return Card(
                                child: ListTile(
                                  onTap: ((){
                                    setState(() {

                                      expense.category=state.categories[i];
                                      categoryController.text=state.categories[i].name;

                                    });
                                  }),
                                  title: Text(state.categories[i].name),
                                  leading: Image.asset(
                                    "assets/icons/${state.categories[i]
                                        .icon}.png", scale: 20,),
                                  tileColor: Color(
                                      state.categories[i].color),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              );
                            })

                        ),
                      ),
                      //Todo date field
                      const SizedBox(height: 32,),
                      ExpenseField(prefixIcon: FontAwesomeIcons.clock,
                        readOnly: true,
                        hintText: "Date",
                        controller: dateController,
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              initialDate: expense.dateTime
                              ,
                              lastDate: DateTime.now().add(Duration(days: 365)));
                          if (newDate != null) {
                            setState(() {
                              dateController.text = DateFormat('EEE, d/ M/ y').format(newDate);
                              // selectedDate = newDate;
                              expense.dateTime = newDate;
                            });
                          }
                        },

                      ),
                      const SizedBox(height: 32,),
                      SizedBox(width: double.infinity, height: kToolbarHeight,
                          child: isLoading == true ?  Center(child: CircularProgressIndicator(),)
                              : TextButton(
                                onPressed: () {
                                  setState(() {
                                    expense.amount=int.parse(expenseController.text);
                                  });
                                  context.read<CreateExpenseBloc>().add(CreateExpenseEvent( expense));
                                },
                                style: TextButton
                                .styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                                child: Text(
                                  "Save", style: TextStyle(color: Colors.white),))
                      )

                    ],
                  ),
                ),
              );
            }
            else{
              return Center(
                child: CircularProgressIndicator(),);
            }

            },
  ),
        ),
    ),
);
  }
}
