import 'package:flutter/cupertino.dart';
import 'package:expense_repositories/src/repository/expense/expense_repository.dart' ;
import 'package:expense_tracker/screens/add_expense/widget/expense_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

import '../bloc/create_categorybloc/create_category_bloc.dart';


Future getCategoryCreation(BuildContext context,String uid) {

  List<String> categoryList=["entertainment","food","home","pet","shopping","tech","travel"];

  return showDialog(context: context, builder: (ctx){
    String iconSelected="";
    Color categoryColor = Colors.white;
    bool isExpanded=false;
    TextEditingController categoryNameController=TextEditingController();
    TextEditingController categoryIconController=TextEditingController();
    TextEditingController categoryColorController=TextEditingController();

    bool isLoading=false;
    Category category = Category.empty;


    return BlocProvider.value(
      value: context.read<CreateCategoryBloc>(),

      child: StatefulBuilder(
        builder: (ctx,setState) {
          return BlocListener<CreateCategoryBloc, CreateCategoryState>(
            listener: (context, state) {
              if (state is CreateCategorySuccess) {
                Navigator.pop(ctx,category);
              } else if (state is CreateCategoryLoading) {
                setState(() {
                  isLoading = true;
                });
              }
            },
            child: AlertDialog(
              backgroundColor: Colors.blue[50], // Set your desired color here

              title: const Text("Create a Category"),

              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9, // or 300, 350, etc.
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ExpenseField(borderRadius: 12,
                        hintText: "Name",
                        controller: categoryNameController),
                    SizedBox(height: 16,),
                    ExpenseField(borderRadius: 12,
                      hintText: "Icon",
                      controller: categoryIconController,
                      readOnly: true,
                      suffixIcon: FontAwesomeIcons.chevronDown,
                      suffixIconSize: 12,
                      onTap: () {
                        setState(() => isExpanded = !isExpanded);
                      },),
                    isExpanded ? Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 200,
                      decoration: BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(12)
                        ),

                      ),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            crossAxisCount: 3),

                        itemCount: categoryList.length,
                        itemBuilder: (context, int i) {
                          return GestureDetector(
                            onTap: () {
                              setState(() => iconSelected = categoryList[i]);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 3,
                                      color: iconSelected == categoryList[i]
                                          ? Colors.green
                                          : Colors.grey
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/${categoryList[i]}.png')
                                      , fit: BoxFit.cover
                                  )
                              ),

                            ),
                          );
                        },
                      ),
                    ) : Container(),
                    SizedBox(height: 16,),

                    //Todo Color Field
                    ExpenseField(borderRadius: 16,
                      hintText: "Color",
                      controller: categoryColorController,
                      fillColor: categoryColor,
                      readOnly: true,
                      onTap: () {
                        showDialog(context: context, builder: (ctx2) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ColorPicker(
                                  pickerColor: Colors.blue,
                                  onColorChanged: (color) {
                                    setState(() {
                                      categoryColor = color;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: TextButton(onPressed: () {
                                    Navigator.pop(ctx2);
                                  }, style: TextButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12))),
                                      child: Text("Save color",
                                        style: TextStyle(
                                            color: Colors.white),)),
                                )
                              ],
                            ),
                          );
                        });
                      },

                    ),
                    SizedBox(height: 16,),

                    SizedBox(width: double.infinity, height: kToolbarHeight,
                        child: isLoading == true ?
                        const Center(child: CircularProgressIndicator(),)
                            : TextButton(
                            onPressed: () {
                              //todo save category button
                              setState(() {
                                category.categoryId = Uuid().v1();
                                category.name = categoryNameController.text;
                                category.icon = iconSelected;
                                // ignore: deprecated_member_use
                                category.color = categoryColor.value;
                              });

                              context.read<CreateCategoryBloc>().add(CreateCategoryEvent(category,uid));

                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            child: Text(
                              "Save", style: TextStyle(color: Colors.white),))
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  });

}