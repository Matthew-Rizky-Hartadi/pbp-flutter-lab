import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}
class Data {
  static List budgetData = [];
}
class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? title = "Income";
  int amount = 0;
  List budgetData = [];
  String? choose;
  List<String> type = ['Income', 'Expense'];
  DateTime? dateTime;

  buttonColor() {
    if(dateTime == null) {
      return MaterialStateProperty.all(Colors.blueGrey.shade600);
    } else {
      return MaterialStateProperty.all(Colors.green);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Budget Info'),
      ),
      drawer: displayDrawer.display(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(5.0),
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Title",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          title = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          title = value!;
                        });
                      },
                      // Validator as form validation
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Title cannot be empty!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          amount = int.parse(value!);
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          amount = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Amount cannot be empty!';
                        }
                        return null;
                      },
                    ),
                  ),

                  DropdownButton(
                    hint: const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                            "Choose Type"
                        )
                    ),
                    value: choose,
                    underline: const SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: type.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        choose = newValue ?? "";
                      });
                    },
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: buttonColor(),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Pick a date",
                          style: TextStyle(color: Colors.white,)
                      )
                    ),

                    onPressed:() {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2030),
                      ).then((date) {
                        setState(() {
                          dateTime = date;
                        });
                      });
                    },

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate() && dateTime != null) {
                        var childData = [];
                        childData.add(title);
                        childData.add(amount);
                        childData.add(choose);
                        childData.add(dateTime);
                        Data.budgetData.add(childData);
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => const MyFormPage()
                        ));
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ]
            )
        )
    );
  }
}