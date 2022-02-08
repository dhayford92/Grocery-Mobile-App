class User {
  int? id;
  String? password;
  String? fullname;
  String? email;
  String? number;
  String? tokens;


  User({
    this.id,
    this.password,
    this.fullname,
    this.email,
    this.number,
    this.tokens,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tokens = json['tokens']['access'];
    fullname = json['fullname'];
    email = json['email'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tokens'] = tokens;
    data['fullname'] = fullname;
    data['email'] = email;
    data['number'] = number;
    return data;
  }
}
