import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Text Variables
final fruitInfoDoc =
    FirebaseFirestore.instance.collection('fruitsAndVegetable');
final fruitQuoteDoc = FirebaseFirestore.instance.collection('suggestions');
