part of 'services.dart';

///In class services, For Sign Up, Sign In, Sign Out
class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  ///Method Sign Up parameter email, password, name, number
  static Future<SignInSignUpResult> signUp(
      String email, String password, String name,
      {String role = "user"}) async {
    try {
      //Try (try), if there is an error then catch (capture) Message.e
      //createUserWithEmailAndPassword when on the hover it returns AuthResult.
      //In the results line 14, restore the user object.
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //If FirebaseAuth is successful then we will make another user data in Firestore
      //All email data, passwords, names, selectedGenre/language will be stored in Firestore
      //Convert Firebaseuser Becomes a User

      //Make a user model before going to the line below.
      UserModel user = result.user.convertToUser(
          name: name,
          role: role); //After becoming a new user, send it to Firestore

      await UserServices.updateUser(user ?? "Not Available");

      return SignInSignUpResult(user: user ?? "Not Available");
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1]);
      //PlatformException(ERROR_WRONG_PASSWORD, The password is invalid or the user does not have a password., null, null)
      //.split(,)[1] is based on a coma (,) taking the 1st index array so that in the Console Show the Password ...
    }
  }

  ///Method signIn parameter email and password
  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      //Create a user from Firebase User in Result Line 38, then make another extension
      UserModel user = await result.user.fromFireStore() ?? "Not Available";

      return SignInSignUpResult(user: user ?? "Not Available");
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1]);
      //PlatformException(ERROR_WRONG_PASSWORD, The password is invalid or the user does not have a password., null, null)
      //.split(,)[1] is based on a coma (,) taking the 1st index array so that in the Console Show the Password ...
    }
  }

  ///Method signIn with Google
  Future<SignInSignUpResult> signInwithGoogle() async {
    try {
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential result = await _auth.signInWithCredential(credential);
      //Create a user from Firebase User in Result Line 38, then make another extension
      UserModel user = await result.user.fromFireStore() ?? "Not Available";

      return SignInSignUpResult(user: user ?? "Not Available");
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1]);
      //PlatformException(ERROR_WRONG_PASSWORD, The password is invalid or the user does not have a password., null, null)
      //.split(,)[1] is based on a coma (,) taking the 1st index array so that in the Console Show the Password ...
    }
  }

  ///Method signOut
  static Future<void> signOut() async {
    await _auth.signOut();
  }

  ///Method resetPassword
  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  ///This Authentication/SharedPreferences from Firebase, already has stream
  ///_auth.onAuthStateChanged this will notify if there is a change in status in authentication
  static Stream<User> get userStream => _auth.authStateChanges() ?? "";
}

///Class for try catch
class SignInSignUpResult {
  final UserModel user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
