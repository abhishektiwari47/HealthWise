import 'package:Healthwise/helpers/constants.dart';
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
  // var dataAsString = <String>[];

  @override
  void initState() {
    super.initState();
    // getUsers();
    getUserById();
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
                Container(
                  height: 255,
                  width: double.infinity,
                  color: fadedBgColor,
                  child: fruits.length > 0
                      ? ImageFromNetwork(ulr: fruits[20].data.toString())
                      : const Icon(
                          Icons.image,
                          color: whiteColor,
                        ),
                ),
                SuggestionTextTile(
                    suggestionText:
                        fruits.length > 0 ? fruits[21].data.toString() : "...",
                    colorOfIcon: iconColor,
                    colorOfTiles: positivePointColor,
                    leadingIcon: Icons.check),
                SuggestionTextTile(
                    suggestionText:
                        fruits.length > 0 ? fruits[22].data.toString() : "...",
                    colorOfIcon: iconColor2,
                    colorOfTiles: negetivePointColor,
                    leadingIcon: Icons.clear),
                Container(
                  height: 100,
                  child: const Center(
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
                      if (fruits.length > 0) {
                        print("^^^^^^^^^^^^^^^^We entered this");
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: fruits.length - 3,
                            itemBuilder: (BuildContext context, int index) {
                              return EditedListTile(
                                fruits: fruits,
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
  const EditedListTile({super.key, required this.fruits, required this.index});

  final List<Fruit> fruits;
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
          fruits[index].data.toString(),
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
