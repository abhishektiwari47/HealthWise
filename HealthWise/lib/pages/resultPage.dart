import 'package:Healthwise/helpers/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  String e = '';
  List dataAsString = ['', '', '', ''];
  @override
  void initState() {
    super.initState();
    // getUsers();
    getUserById();
  }

  getUserById() {
    final String id = itemName;
    userRef.doc(id).get().then((DocumentSnapshot doc) {
      // final x = doc.data();
      // docId= doc.id;
      objectToString = doc.data().toString();
      String temp = '';
      // print(doc.data());
      // print(doc.id);
      int i = 1;
      int j = 0;
      bool end = false;
      //We are just parsing the object into string.
      while (objectToString[i] != '}') {
        if (objectToString[i - 1] == ' ' && objectToString[i - 2] == ':') {
          while (objectToString[i] != ',' && end != true) {
            // print(z[i]);
            temp += objectToString[i];
            if (objectToString[i + 1] != '}') {
              i++;
            } else {
              end = true;
            }
          }
          dataAsString[j] = temp;
          temp = '';
          j++;
        }
        i++;
      }
      // print(dataAsString[0]);
      // print(dataAsString[1]);
      // print("+++++++++++");
      // print(dataAsString[2]);
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
      appBar:
          AppBar(backgroundColor: primary_color, title: Text(dataAsString[0])),
      body: Container(
        child: Column(children: [
          ListTile(
            title: Text(dataAsString[0]),
          ),
          ListTile(
            title: Text(dataAsString[1]),
          ),
          ListTile(
            title: Text(dataAsString[2]),
          ),
          ListTile(
            title: Text(dataAsString[3]),
          ),
        ]),
      ),
    );
  }
}
