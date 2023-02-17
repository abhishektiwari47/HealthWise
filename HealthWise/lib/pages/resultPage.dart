import 'package:Healthwise/helpers/dataVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../helpers/backEnd.dart';
import '../helpers/frontEnd.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  // String docId = '';
  String objectToString = '';

  // List of string for storing..
  var dataAsString = <String>[];

  @override
  void initState() {
    super.initState();
    // getUsers();
    getUserById();
  }

  getUserById() {
    final String id = itemName;
    fruitInfoDoc.doc(id).get().then((DocumentSnapshot doc) {
      // final x = doc.data();
      // docId= doc.id;
      objectToString = doc.data().toString();
      String temp = '';
      // print(doc.data());
      // print(doc.id);
      int i = 1;

      bool end = false;
      //We are just parsing the object into string.
      while (objectToString[i] != '}') {
        if (objectToString[i - 1] == ' ' && objectToString[i - 2] == ':') {
          while (objectToString[i] != ',' && end != true) {
            temp += objectToString[i];
            if (objectToString[i + 1] != '}') {
              i++;
            } else {
              end = true;
            }
          }
          //Here I add all the strings to list...
          // This line works fine.
          dataAsString.add(temp);
          temp = '';
          print("The code below this line prints everything perfectly");
          print(dataAsString.length);
          print(dataAsString[0]);
        }
        i++;
      }
      // print(dataAsString[0]);
      // for (var k in dataAsString) {
      //   print(k);
      // }
      // print(dataAsString);

      setState(() {});
    });
  }

  // getUsers() {
  //   userRef.get().then((QuerySnapshot snapshot) {
  //     snapshot.docs.forEach((DocumentSnapshot doc) {
  //       print(doc.data());
  //       print(doc.id);
  //       print(doc.exists);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: primary_color, title: Text("Apple")),
      body: Builder(
        builder: (context) {
          if (dataAsString.length >= 2) {
            return ListView(children: [
              ListTile(
                title: Text(dataAsString[0]),
              ),
              ListTile(
                title: Text(dataAsString[1]),
              ),
              ListTile(
                title: Text(dataAsString[2]),
              ),
            ]);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
