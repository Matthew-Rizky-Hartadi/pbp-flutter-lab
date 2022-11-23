import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';
import "package:counter_7/page/budget_data.dart";
import "package:counter_7/page/budget_form.dart";
import "package:counter_7/page/details.dart";
import 'package:counter_7/main.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({Key? key}) : super(key: key);

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  Future<List<MyWatchList>> fetchToDo() async {
    var url = Uri.parse('https://pbp-assignment-2-matthew.herokuapp.com/mywatchlist/json/');
    http.Response response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );
    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    // convert the json data into ToDo object
    List<MyWatchList> listMyWatchList = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchList.add(MyWatchList.fromJson(d["fields"]));
      }
    }
    return listMyWatchList;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              // Adding clickable menu
              ListTile(
                title: const Text('Counter'),
                onTap: () {
                  // Route the menu to the main page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
              ),
              ListTile(
                title: const Text('Form'),
                onTap: () {
                  // Route the menu to the form page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFormPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Budget Data'),
                onTap: () {
                  // Route the menu to the to do page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyDataPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('My Watch List'),
                onTap: () {
                  // Route the menu to the to do page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: fetchToDo(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "My Watch List list is empty :(",
                        style: TextStyle(
                            color: Color(0xff59A5D8),
                            fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index)=> Card(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),

                        child: ListTile(
                          title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)  => DetailsPage(rating: snapshot.data![index].rating,releaseDate: snapshot.data![index].releaseDate, review: snapshot.data![index].review, title: snapshot.data![index].title, watched: snapshot.data![index].watched)
                            ));
                          }
                        ),
                      )
                  );
                }
              }
            }
        )
    );
  }

}