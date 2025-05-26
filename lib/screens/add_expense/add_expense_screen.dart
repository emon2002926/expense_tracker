import 'package:expense_repositories/src/repository/expense/expense_repository.dart';
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
  final String email;
  const AddExpenseScreen({super.key, required this.email});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  late Expense expense;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('EEE, d/ M/ y').format(DateTime.now());
    expense = Expense.empty;
    expense.expenseId = const Uuid().v1();
    print("email:${widget.email}");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateExpenseBloc, CreateExpenseState>(
      listener: (context, state) {
        if (state is CreateExpenseSuccess) {
          Navigator.pop(context, true);
        } else if (state is CreateExpenseLoading) {
          setState(() => isLoading = true);
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.grey[100],
            elevation: 0,
          ),
          body: BlocBuilder<GetCategoryBloc, GetCategoryState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Screen title
                    GeneralTextview(
                      text: "Add Expense",
                      color: Colors.grey[800],
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 20),

                    // Amount field
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ExpenseField(
                        prefixIcon: FontAwesomeIcons.dollarSign,
                        borderRadius: 30,
                        hintText: "",
                        controller: expenseController,
                        textInputType:TextInputType.number,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Category input field (tappable but not editable)
                    TextFormField(
                      controller: categoryController,
                      textAlign: TextAlign.center,
                      readOnly: true,
                      onTap: () {},
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: expense.category == Category.empty
                            ? Colors.white
                            : Color(expense.category.color),
                        prefixIcon: expense.category == Category.empty
                            ? const Icon(FontAwesomeIcons.list,
                            size: 16, color: Colors.grey)
                            : Image.asset(
                          "assets/icons/${expense.category.icon}.png",
                          scale: 20,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(FontAwesomeIcons.add,
                              size: 16, color: Colors.grey),
                          onPressed: () async {
                            final newCategory =
                            await getCategoryCreation(context);
                            if (state is GetCategorySuccess) {
                              setState(() {
                                state.categories.insert(0, newCategory);
                              });
                            }
                          },
                        ),
                        hintText: "Category",
                        border: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    // Category list or loading/error states
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(12)),
                      ),
                      child: () {
                        if (state is GetCategoryLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is GetCategorySuccess) {
                          if (state.categories.isEmpty) {
                            return const Center(child: Text("No categories found"));
                          } else {
                            return ListView.builder(
                              itemCount: state.categories.length,
                              itemBuilder: (context, i) {
                                final category = state.categories[i];
                                return Card(
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        expense.category = category;
                                        categoryController.text = category.name;
                                      });
                                    },
                                    title: Text(category.name),
                                    leading: Image.asset(
                                      "assets/icons/${category.icon}.png",
                                      scale: 20,
                                    ),
                                    tileColor: Color(category.color),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      }(),
                    ),

                    const SizedBox(height: 32),

                    // Date picker field
                    ExpenseField(
                      prefixIcon: FontAwesomeIcons.clock,
                      readOnly: true,
                      hintText: "Date",
                      controller: dateController,
                      onTap: () async {
                        final newDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          initialDate: expense.dateTime,
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (newDate != null) {
                          setState(() {
                            dateController.text =
                                DateFormat('EEE, d/ M/ y').format(newDate);
                            expense.dateTime = newDate;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 32),

                    // Save button or loading indicator
                    SizedBox(
                      width: double.infinity,
                      height: kToolbarHeight,
                      child: isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : TextButton(
                        onPressed: () {
                          setState(() {
                            expense.amount =
                                int.tryParse(expenseController.text) ?? 0;
                          });
                          context
                              .read<CreateExpenseBloc>()
                              .add(CreateExpenseEvent(expense,widget.email));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
