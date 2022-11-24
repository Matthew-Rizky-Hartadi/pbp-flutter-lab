import 'package:flutter/material.dart';
import 'package:counter_7/page/budget_form.dart';
import 'package:counter_7/page/drawer.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({ super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Data'),
      ),
      drawer: displayDrawer.display(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          for(var item in Data.budgetData)
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item[0],
                          style: const TextStyle(fontSize: 25)
                          ),
                          Text(item[3].toString().substring(0,10),
                              style: const TextStyle(fontSize: 10)
                          ),
                        ],
                      )
                    ),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${item[1].toString()}\$'),
                          Text('${item[2]}'),
                        ],
                      )
                    ),
                  ],
                )
              ),
            )
        ]
      )
    );
  }
}