import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

final userRef = FirebaseFirestore.instance.collection('fruitsAndVegetable');

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String y = '';
  String z = '';
  String e = '';
  List dataAsString = ['', '', ''];

  @override
  void initState() {
    // getUsers();
    getUserById();

    super.initState();
  }

  getUserById() {
    final String id = '0 Apple';
    userRef.doc(id).get().then((DocumentSnapshot doc) {
      final x = doc.data();
      y = doc.id;
      z = doc.data().toString();
      String temp = '';
      // print(doc.data());
      // print(doc.id);
      int i = 1;
      int j = 0;
      bool end = false;
      while (z[i] != '}') {
        if (z[i - 1] == ' ' && z[i - 2] == ':') {
          while (z[i] != ',' && end != true) {
            // print(z[i]);
            temp += z[i];
            if (z[i + 1] != '}') {
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
      appBar: AppBar(title: Text(y)),
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
        ]),
      ),
    );
  }
}
