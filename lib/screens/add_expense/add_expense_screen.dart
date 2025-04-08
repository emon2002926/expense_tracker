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

  List<String> categoryList=["entertainment","food","home","pet","shopping","tech","travel"];
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

                // ExpenseField(prefixIcon: FontAwesomeIcons.list,
                //   hintText: "Category",controller: categoryController,),

                TextFormField(
                  controller: categoryController,
                  textAlign: TextAlign.center,
                  readOnly: true,
                  onTap: (){},
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(FontAwesomeIcons.list,size: 16,color: Colors.grey,),
                    suffixIcon: IconButton(onPressed: (){
                      showDialog(context: context, builder: (ctx){
                        bool isExpanded=false;
                        return StatefulBuilder(
                            builder: (context,setState){
                              return AlertDialog(
                                backgroundColor: Colors.blue[50], // Set your desired color here

                                title: const Text("Create a Category"),

                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ExpenseField(borderRadius: 16,hintText: "Name",controller: categoryController),
                                    SizedBox(height: 16,),
                                    ExpenseField(borderRadius: 16,hintText: "Icon",controller: categoryController,readOnly: true,
                                      suffixIcon: FontAwesomeIcons.chevronDown,suffixIconSize: 12,
                                      onTap:() {setState(()=>isExpanded=!isExpanded);},),
                                    isExpanded?Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(16)
                                        ),

                                      ),
                                      child:ListView.builder(
                                        itemCount: categoryList.length ,
                                        itemBuilder: (context,int i){
                                          return Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage("assets/${categoryList[i]}.png"))
                                            ),
                                          );
                                        },
                                      ) ,
                                    ):Container(),
                                    SizedBox(height: 16,),
                                    ExpenseField(borderRadius: 16,hintText: "Color",controller: categoryController),
                                  ],
                                ),
                              );

                            }

                        );
                      });
                    }, icon: Icon(FontAwesomeIcons.add,size: 16,color: Colors.grey,)),
                    hintText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide.none
                    )
                )

                ),
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
