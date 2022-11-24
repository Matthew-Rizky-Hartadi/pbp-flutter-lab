import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';
import "package:counter_7/page/details.dart";
import 'package:counter_7/page/drawer.dart';

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

  bool status = false;
  checkStatus(String status1) {

      if (status1 == 'watched') {
        status = true;
      } else {
        status =  false;
      }

    return status;
  }

  String convert(String status2) {
    String switch1 = "";
    if (status2 == "watched") {
      switch1 = 'not watched';
    } else {
      switch1 = 'watched';
    }
    return switch1;
  }

  BorderColor(String watched) {
    if (watched == 'watched') {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: displayDrawer.display(context),
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
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Checkbox(
                                value: checkStatus(snapshot.data![index].watched),
                                onChanged: (bool? value) {
                                  setState(() {
                                    snapshot.data![index].watched = convert(snapshot.data![index].watched);
                                  });
                                }
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          tileColor: BorderColor(snapshot.data![index].watched),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)  => DetailsPage(rating: snapshot.data![index].rating,
                                  releaseDate: snapshot.data![index].releaseDate,
                                  review: snapshot.data![index].review,
                                  title: snapshot.data![index].title,
                                  watched: snapshot.data![index].watched)
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