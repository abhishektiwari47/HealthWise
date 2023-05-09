import 'package:Healthwise/helpers/dataVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
    String id = itemName.toLowerCase().trim();

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
          print(dataAsString);
        }
        i++;
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: bgColor,
            title: Center(
              child: Text(
                itemName.trim().toUpperCase(),
                style: TextStyle(
                    //Fruit Name
                    color: iconColor,
                    fontSize: 15),
              ),
            )),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            // color: Color.fromARGB(255, 73, 122, 76),
            height: MediaQuery.of(context).size.height * 3.7,
            child: Column(
              children: [
                // Container(
                //   child: Column(
                //     children: [
                //       Container(
                //         height: 10,
                //         width: 30,
                //         color: Colors.red,
                //       ),
                //     ],
                //   ),
                //   color: Color.fromARGB(255, 150, 50, 50),
                //   height: 200,
                //   width: double.infinity,
                // ),
                Container(
                  height: 255,
                  width: double.infinity,
                  color: Color.fromARGB(255, 241, 162, 162),
                  child: dataAsString.length > 0
                      ? ImageFromNetwork(ulr: dataAsString[20])
                      : Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                ),

                SuggestionTextTile(
                    suggestionText:
                        dataAsString.length > 0 ? dataAsString[21] : "...",
                    colorOfIcon: Colors.green,
                    colorOfTiles: positivePointColor,
                    leadingIcon: Icons.check),
                SuggestionTextTile(
                    suggestionText:
                        dataAsString.length > 0 ? dataAsString[22] : "...",
                    colorOfIcon: Colors.red,
                    colorOfTiles: negetivePointColor,
                    leadingIcon: Icons.clear),

                Container(
                  height: 100,
                  child: Center(
                      child: Text(
                    "Nutrition Value",
                    style: TextStyle(
                        fontSize: 40,
                        color: specialTileColor,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (dataAsString.length > 0) {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 20,
                            itemBuilder: (BuildContext context, int index) {
                              return EditedListTile(
                                dataAsString: dataAsString,
                                index: index,
                              );
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditedListTile extends StatelessWidget {
  const EditedListTile(
      {super.key, required this.dataAsString, required this.index});

  final List<String> dataAsString;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(1, 1, 1, 0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          // side: BorderSide(
          //   width: 1.5,
          //   //Tile Border
          //   color: Color.fromARGB(255, 255, 227, 227),
          // ),
        ),

        contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        subtitle: Text(
          "per 100 gram",
          style: TextStyle(
            //subtitle
            color: whiteColor,
          ),
        ),
        //Tile Color
        tileColor: specialTileColor,
        leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Center(
                child: Text(
              (index + 1).toString(),
              style: TextStyle(
                  //index
                  color: specialTileColor,
                  fontSize: 15),
            ))),
        // trailing: const Text(
        //   "per 100g",
        //   style: TextStyle(
        //       color: Color.fromARGB(255, 85, 141, 87),
        //       fontSize: 15),
        // ),
        title: Text(
          dataAsString[index],
          style: TextStyle(
              fontWeight: FontWeight.bold, color: whiteColor, fontSize: 18),
        ),
      ),
    );
  }
}

class SuggestionTextTile extends StatelessWidget {
  SuggestionTextTile({
    super.key,
    required this.suggestionText,
    required this.colorOfIcon,
    required this.leadingIcon,
    required this.colorOfTiles,
  });

  final String suggestionText;

  final IconData leadingIcon;
  final Color colorOfIcon, colorOfTiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(1, 10, 1, 10),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          // side: BorderSide(
          //   width: 1.5,
          //   //Tile Border
          //   color: Color.fromARGB(255, 255, 227, 227),
          // ),
        ),

        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),

        //Tile Color
        tileColor: colorOfTiles,
        leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: colorOfIcon,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Center(
                child: Icon(
              leadingIcon,
              color: whiteColor,
            ))),
        // trailing: const Text(
        //   "per 100g",
        //   style: TextStyle(
        //       color: Color.fromARGB(255, 85, 141, 87),
        //       fontSize: 15),
        // ),
        title: Text(
          suggestionText,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: textColorGrey,
              fontSize: 18),
        ),
      ),
    );
  }
}
