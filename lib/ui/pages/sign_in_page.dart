part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSignIn = false;
  bool isHidePassword = false;

  dynamic _userData;
  AccessToken _accessToken;
  bool _checking = true;

  String twitterStatus = "No Logged";

  @override
  Widget build(BuildContext context) {
    print('Page: SignInPage');
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: GeneralPage(
        title: 'Sign In',
        subtitle: 'Find your best ever coffee',
        child: Column(
          children: [
            CustomTextField(
              labelText: 'Email Address',
              hintText: 'Type your email address',
              hintStyle: greyFontStyle,
              marginTop: 26,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              onChanged: (text) {
                setState(() {
                  isEmailValid = EmailValidator.validate(text);
                });
              },
            ),
            CustomTextField(
              labelText: 'Password',
              hintText: 'Type your password',
              hintStyle: greyFontStyle,
              marginTop: 16,
              controller: passwordController,
              obscureText: !isHidePassword,
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isHidePassword = !isHidePassword;
                    });
                  },
                  child: Theme(
                    data: Theme.of(context).copyWith(primaryColor: null),
                    child: (!isHidePassword)
                        ? Icon(
                            Icons.visibility_off,
                            size: 20,
                            color: Color(0xFFC6C6C6),
                          )
                        : Icon(
                            Icons.visibility,
                            size: 20,
                            color: Color(0xFFC6C6C6),
                          ),
                  )),
              onChanged: (text) {
                setState(() {
                  isPasswordValid = text.length >= 6;
                });
              },
            ),
            CustomButton(
              child: isSignIn
                  ? LoadingIndicator()
                  : CustomElevatedButton(
                      title: 'Sign In',
                      colorButton: isEmailValid && isPasswordValid
                          ? mainColor
                          : Color(0xFFE4E4E4),
                      onPressed: isEmailValid && isPasswordValid
                          ? () async {
                              setState(() {
                                isSignIn = true;
                              });
                              SignInSignUpResult result =
                                  await AuthServices.signIn(
                                      emailController.text,
                                      passwordController.text);

                              if (result.user == null) {
                                setState(() {
                                  isSignIn = false;
                                });

                                Flushbar(
                                  duration: Duration(seconds: 4),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: redColor,
                                  message: result.message,
                                )..show(context);
                              }
                            }
                          : null),
            ),
            CustomButton(
              child: CustomElevatedButton(
                title: 'Create New Account',
                colorButton: greyColor,
                onPressed: () {
                  context
                      .read<PageBloc>()
                      .add(GoToRegistrationPage(RegistrationData()));
                },
              ),
            ),
            RawMaterialButton(
              onPressed: () {},
              child: Text(
                "Or Login with",
                style: subTitleLightBlackTextAR(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () async {
                    setState(() {
                      isSignIn = true;
                    });
                    SignInSignUpResult result =
                        await AuthServices().signInwithGoogle();

                    if (result.user == null) {
                      setState(() {
                        isSignIn = false;
                      });

                      Flushbar(
                        duration: Duration(seconds: 4),
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: redColor,
                        message: result.message,
                      )..show(context);
                    }
                    // await FireStoreUtils.signInwithGoogle().then(
                    //   (value) => Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(
                    //       builder: (context) => Wrapper(),
                    //     ),
                    //   ),
                    // );
                  },
                  child: Image.asset("assets/icons/google-plus.png"),
                ),
                // InkWell(
                //   onTap: () async {
                //     await FireStoreUtils.loginWithApple().then(
                //       (value) => Navigator.of(context).pushReplacement(
                //         MaterialPageRoute(
                //           builder: (context) => Wrapper(),
                //         ),
                //       ),
                //     );
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //     child: Image.asset("assets/icons/twitter.png"),
                //   ),
                // ),
                InkWell(
                  onTap: () async {
                    await FireStoreUtils.loginWithFacebook().then(
                      (value) => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Wrapper(),
                        ),
                      ),
                    );
                  },
                  child: Image.asset("assets/icons/facebook.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // _printCredentials(LoginResult result) {
  //   _accessToken = result.accessToken;
  //   print("userId: ${result.accessToken.userId}");
  //   print("token: ${prettyPrint(_accessToken.toJson())}");
  //   print("expires: ${result.accessToken.expires}");
  //   print("grantedPermission: ${result.accessToken.grantedPermissions}");
  //   print("declinedPermissions: ${result.accessToken.declinedPermissions}");
  // }

  // _checkIfIsLogged() async {
  //   final AccessToken accessToken = await FacebookAuth.instance.isLogged;
  //   setState(() {
  //     _checking = false;
  //   });
  //   if (accessToken != null) {
  //     print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
  //     // now you can call to  FacebookAuth.instance.getUserData();
  //     final userData = await FacebookAuth.instance.getUserData();
  //     // final userData = await FacebookAuth.instance.getUserData(fields:"email,birthday");
  //     _accessToken = accessToken;
  //     setState(() {
  //       _userData = userData;
  //     });
  //   }
  // }

  // Future<Null> _facebookLogin() async {
  //   final result = await FacebookAuth.instance.login();
  //   // final result = await FacebookAuth.instance.login(permissions:['email','user_birthday']);

  //   switch (result.status) {
  //     case FacebookAuthLoginResponse.ok:
  //       _printCredentials(result);
  //       // get the user data
  //       final userData = await FacebookAuth.instance.getUserData();
  //       // final userData = await _fb.getUserData(fields:"email,birthday");
  //       _userData = userData;
  //       break;
  //     case FacebookAuthLoginResponse.cancelled:
  //       print("login cancelled");
  //       break;
  //     default:
  //       print("login failed");
  //   }

  //   setState(() {});
  // }

  // void _showMessage(String message) {
  //   setState(() {
  //     message = message;
  //   });
  // }

  // static final TwitterLogin twitterLogin = new TwitterLogin(
  //   consumerKey: '1OR06t702rtEEMGEDhe5Lfxpd',
  //   consumerSecret: 'vw7jKpy45DlE8Y0wpB5o886olhTgwsfFbLoRTmftWRGQ1qQwnT',
  // );

  // String _message = 'Logged out.';

  // void _twitterLogin() async {
  //   final TwitterLoginResult result = await twitterLogin.authorize();
  //   String newMessage;

  //   switch (result.status) {
  //     case TwitterLoginStatus.loggedIn:
  //       newMessage = 'Logged in! username: ${result.session.username}';
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (BuildContext context) =>
  //       //         Chat(userData: result.session.username),
  //       //   ),
  //       // );
  //       break;
  //     case TwitterLoginStatus.cancelledByUser:
  //       newMessage = 'Login cancelled by user.';
  //       break;
  //     case TwitterLoginStatus.error:
  //       newMessage = 'Login error: ${result.errorMessage}';
  //       break;
  //   }

  //   setState(() {
  //     _message = newMessage;
  //   });
  // }

  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();

  // Future<String> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount googleSignInAccount =
  //         await googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.getCredential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );

  //     final FirebaseUser user = await _auth.signInWithCredential(credential);

  //     assert(!user.isAnonymous);
  //     assert(await user.getIdToken() != null);

  //     final FirebaseUser currentUser = await _auth.currentUser();
  //     assert(user.uid == currentUser.uid);

  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => Chat(userData: user.email),
  //       ),
  //     );

  //     return 'signInWithGoogle succeeded: $user';
  //   } catch (error) {
  //     print('error............ $error');
  //   }
  // }

  // void signOutGoogle() async {
  //   await googleSignIn.signOut();

  //   print("User Sign Out");
  // }
}
