class User {
  String id = '';
  String name = '';
  String x = '';

  User({
    this.id = '',
    required this.name,
    required this.x,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        x: json['x'],
      );
}
