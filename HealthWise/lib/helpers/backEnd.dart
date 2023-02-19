import 'package:cloud_firestore/cloud_firestore.dart';

//Text Variables
final fruitInfoDoc =
    FirebaseFirestore.instance.collection('fruitsAndVegetables');
final fruitQuoteDoc = FirebaseFirestore.instance.collection('suggestions');
