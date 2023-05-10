import 'package:Healthwise/helpers/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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


