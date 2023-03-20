import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Colour Variables
final primary_color = Color.fromARGB(255, 241, 148, 148);

//Size Variables
final general_padding = const EdgeInsets.all(8.0);

//Text Variables
final application_name = Text("HealthWise");

//Button Functions

//fruit Card
class FruitCard extends StatelessWidget {
  const FruitCard({
    super.key,
    required this.dataAsString,
  });

  final List<String> dataAsString;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 320,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFFffffff),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 253, 209, 209),
            blurRadius: 3.0, // soften the shadow
            spreadRadius: 3.0, //extend the shadow
          )
        ],
      ),
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
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 255, 248, 248),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Text(
                    dataAsString[1],
                    style: TextStyle(
                      color: Color.fromARGB(255, 80, 80, 80),
                      fontSize: 15,
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

//NetworkImageWithLoadingIndicator

class ImageFromNetwork extends StatelessWidget {
  const ImageFromNetwork({
    super.key,
    required this.ulr,
  });

  final String ulr;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      ulr,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          // child: Icon(Icons.image),

          child: CircularProgressIndicator(
            color: Color.fromARGB(255, 255, 200, 200),
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }
}


//Floating Buttons As functions


