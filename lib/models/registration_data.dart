part of 'models.dart';

///Model to save User registration
class RegistrationData {
  String email;
  String name;
  File profileImage; //Select the image of the device so the type of data file.
  String password;

  // final String id;
  // final String email;
  // final String name;
  // final String profilePicture;
  // final String role;

//The constructor parameter is optional with empty string value and empty selectedGenres list.
  RegistrationData(
      {this.email = "", this.name = "", this.profileImage, this.password = ""});
}
