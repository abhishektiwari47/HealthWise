import 'package:Healthwise/helpers/frontEnd.dart';
import 'package:flutter/material.dart';

class FruitCard extends StatelessWidget {
  const FruitCard({
    super.key,
    required this.dataAsString,
  });

  final List<String> dataAsString;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      width: 320,
      decoration: mainWhiteBoxDecoration,
      //FruitCard title
      child: Column(
        children: [
          // Container(
          //   height: 40,
          //   width: 300,
          //   color: Colors.pink,
          //   child: Center(
          //     child: dataAsString.length > 0
          //         ? Text(
          //             dataAsString[2],
          //             style: TextStyle(
          //               color: Color.fromARGB(255, 255, 255, 255),
          //               fontSize: 20,
          //             ),
          //           )
          //         : Text(
          //             '. . .',
          //             style: TextStyle(
          //               color: Color.fromARGB(255, 253, 126, 153),
          //               fontSize: 25,
          //             ),
          //           ),
          //   ),
          // ),

          Container(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 255, 248, 248),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),

                  height: 200,
                  width: 300,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     fit: BoxFit.fill,
                  //     image: NetworkImage(
                  //       dataAsString[0]

                  //     ),
                  //   ),
                  // ),
                  child: dataAsString[0] != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ImageFromNetwork(ulr: dataAsString[0]))
                      : Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                    child: Text(
                      dataAsString[1],
                      style: TextStyle(
                        wordSpacing: 2,
                        color: Color.fromARGB(255, 80, 80, 80),
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
