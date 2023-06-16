class UserModel {
  final bool? online;
  final String? uid;
  final String? email;
  final String? name;

  UserModel({
    this.uid,
    this.online,
    this.email,
    this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json[''],
      online: json[''],
      email: json[''],
      name: json[''],
    );
  }
}
