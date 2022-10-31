class User {
  final int id;
  final String name;
  final String email;
  final String idNumber;
  final String photo;
  final String mobile;
  final String address;
  final String createdAt;
  final String token;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.idNumber,
    required this.photo,
    required this.mobile,
    required this.address,
    required this.createdAt,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      idNumber: json['id_number'],
      photo: json['photo'],
      mobile: json['mobile'],
      address: json['address'],
      createdAt: json['created_at'],
      token: json['token'],
      // token :json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['email'] = email;
    json['id_number'] = idNumber;
    json['photo'] = photo;
    json['mobile'] = mobile;
    json['address'] = address;
    json['created_at'] = createdAt;
    json['token'] = token;
    return json;
  }
}
