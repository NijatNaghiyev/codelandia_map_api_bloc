class User {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String gender;
  final String image;
  final Address address;
  final Hair hair;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.image,
    required this.address,
    required this.hair,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        age: json["age"],
        gender: json["gender"],
        image: json["image"],
        address: Address.fromJson(json["address"]),
        hair: Hair.fromJson(json["hair"]),
      );
}

class Address {
  final String address;
  final String city;

  Address({
    required this.address,
    required this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
      );
}

class Hair {
  final String color;
  final String type;

  Hair({
    required this.color,
    required this.type,
  });

  factory Hair.fromJson(Map<String, dynamic> json) => Hair(
        color: json["color"],
        type: json["type"],
      );
}
