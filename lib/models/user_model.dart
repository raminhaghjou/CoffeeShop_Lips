part of 'models.dart';

class UserModel extends Equatable {
  String id;
  String email;
  String name;
  String profilePicture;
  String role;
  // final String historyPay;
  // final String statusPayment;

  UserModel(this.id, this.email, {this.name, this.role, this.profilePicture});

  UserModel.fromJson(Map<String, dynamic> parsedJson) {
    email = parsedJson['email'] ?? '';
    name = parsedJson['name'] ?? '';
    role = parsedJson['role'] ?? '';
    id = parsedJson['id'] ?? '';
    profilePicture = parsedJson['profilePicture'] ?? '';
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'profilePicture': profilePicture,
    };
  }

  UserModel copyWith({String name, String profilePicture}) => UserModel(
        this.id, this.email,
        //The name is taken from a new name, but if not filled in taken from the current name (default)
        name: name ?? this.name,
        profilePicture: profilePicture ?? this.profilePicture,
        //If the selectedGenres remain, it cannot be changed, according to the initial selected in preference_page.dart
        role: role,
      );

  @override
  List<Object> get props => [
        id,
        email,
        name,
        role,
        profilePicture,
      ];
}
