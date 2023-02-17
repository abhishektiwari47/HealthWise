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
