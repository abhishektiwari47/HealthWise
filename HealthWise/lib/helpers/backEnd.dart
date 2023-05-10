import 'package:cloud_firestore/cloud_firestore.dart';

String itemName = '';

List<String> CardFruitList = ["Apple", "Banana", "Carrot"];

//JSON object to List Conversion
final List<Fruit> fruits = [];

class Fruit {
  String name = '';
  dynamic data = '';
  Fruit({
    required this.name,
    required this.data,
  });
}

getUserById() async {
  String id = itemName.toLowerCase().trim();

  await fruitInfoDoc.doc(id).get().then((DocumentSnapshot doc) {
    Object? x = doc.data();
    print(x);

    if (x != null) {
      (x as Map<String, dynamic>).forEach((key, value) {
        if (value != null) {
          var fruit = Fruit(
            name: key,
            data: value,
          );
          fruits.add(fruit);
        }
      });
    }
  });
}

//firebase  collections from where data will be recieved.
final fruitInfoDoc =
    FirebaseFirestore.instance.collection('fruitsAndVegetables');
final fruitQuoteDoc = FirebaseFirestore.instance.collection('suggestions');
