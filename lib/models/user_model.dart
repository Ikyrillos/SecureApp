class User {
  User({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.phone,
  });

  String id;
  String name;
  String dateOfBirth;
  String phone;
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        dateOfBirth: json["dateOfBirth"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dateOfBirth": dateOfBirth,
        "phone": phone,
      };
}
