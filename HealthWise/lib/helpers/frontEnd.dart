import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Colour Variables
final primary_color = Color.fromARGB(255, 241, 148, 148);

//Size Variables
final general_padding = const EdgeInsets.all(8.0);

//Text Variables
final application_name = Text("HealthWise");

//Shadow Variable
List<BoxShadow> mainShadow = [
  BoxShadow(
    color: Color.fromARGB(255, 253, 209, 209),
    blurRadius: 3.0, // soften the shadow
    spreadRadius: 3.0, //extend the shadow
  )
];

//Decoration
Decoration mainWhiteBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  //
  color: Color.fromARGB(255, 255, 255, 255),
  boxShadow: mainShadow,
);

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


