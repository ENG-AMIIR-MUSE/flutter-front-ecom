class User {
  String firstName;
  String lastName;
  String email;
  String phone;

  User({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
    };
  }
}
