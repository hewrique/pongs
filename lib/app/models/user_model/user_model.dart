class UserModel {
  final String name;
  final String userName;
  final String email;
  final String? profilePicture;
  final String? coverPhoto;
  final String? key;

  UserModel({
    required this.name,
    required this.userName,
    required this.email,
    this.profilePicture,
    this.coverPhoto,
    this.key,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      userName: map['userName'],
      email: map['email'],
      profilePicture: map['profilePicture'] ?? '',
      coverPhoto: map['coverPhoto'] ?? '',
      key: map['key'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      'name': name,
      'userName': userName,
      'email': email,
      'profilePicture': profilePicture ?? '',
      'coverPhoto': coverPhoto ?? '',
    };

    return map;
  }
}
