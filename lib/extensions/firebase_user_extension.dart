part of 'extensions.dart';

///SDK Minim 2.6 Extensions
///Previously we made a USER MODEL
///Insert the method into this class extensions
///FirebaseUser - User(Model)

/// [FIREBASE USER EXTENSION]
/// Used to make additional method/getter from FirebaseUser class
extension FirebaseUserExtension on User {
  //gift first initial example for value default
  UserModel convertToUser({String name = "No Name", String role = "user"}) =>
      UserModel(
        this.uid,
        this.email,
        name: name,
        role: role,
      );

  /// Method to getting user data from firestore from auth_services signIn and user_services
  Future<UserModel> fromFireStore() async =>
      await UserServices.getUser(this.uid);
}
