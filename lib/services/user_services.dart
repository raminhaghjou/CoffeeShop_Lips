part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users'); //Name collection = users.

  static Future<void> updateUser(UserModel user) async {
    //Save to Firestore
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'role': user.role,
      'profilePicture': user.profilePicture ??
          "" //If not input photos then the string is empty.
    });
  }

  ///To take from the Firestore
  static Future<UserModel> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();
    return UserModel(
      id,
      snapshot['email'],
      name: snapshot.data().toString().contains('name')
          ? snapshot.get('name')
          : '', //snapshot['name']
      role: snapshot.data().toString().contains('role')
          ? snapshot.get('role')
          : '', //snapshot['role'],
      profilePicture: snapshot.data().toString().contains('profilePicture')
          ? snapshot.get('profilePicture')
          : '', //snapshot['profilePicture'],
    );
  }
}
