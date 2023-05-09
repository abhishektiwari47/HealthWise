import 'package:Healthwise/helpers/dataVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Size Variables
final general_padding = const EdgeInsets.all(8.0);

//Text Variables
final application_name = Text("HealthWise");

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
            color: circularProgressIndicator,
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


