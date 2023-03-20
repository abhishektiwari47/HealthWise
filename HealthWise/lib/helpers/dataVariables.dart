import 'package:flutter/material.dart';

class User {
  String id = '';
  String name = '';
  String x = '';

  User({
    required this.id,
    required this.name,
    required this.x,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    x = json['x'];
  }
}

String itemName = '';

List<String> CardFruitList = ["Apple", "Banana", "Carrot"];

final Color bgColor = Color.fromARGB(255, 253, 239, 238);

final Color textColor = Color.fromARGB(255, 253, 126, 153);
