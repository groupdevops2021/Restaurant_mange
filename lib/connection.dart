import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  static String? name;
  static String? imageUrl;
  static String? uid;
  static String? userEmail;
  //
  // FirebaseAuth.instance
  //     .authStateChanges()
  //     .listen((User? user) {
  // if (user == null) {
  // print('User is currently signed out!');
  // } else {
  // print('User is signed in!');
  // }
  // });
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error logging out");
    }
  }

  Future<bool> loginWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();
    User? user;

    // The `GoogleAuthProvider` can only be used while running on the web
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
          await _auth.signInWithPopup(authProvider);

      user = userCredential.user;
    } catch (e) {
      print(e);
    }

    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setBool('auth', true);
    }
    print("_______${user?.email}");
    if (user?.email?.length != 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> loginWithGoogle1() async {
    try {
      // GoogleSignIn googleSignIn = GoogleSignIn();
      // GoogleSignInAccount? account = await googleSignIn.signIn();
      // if (account == null) {
      //   return false;
      // }
      // res = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
      //   idToken: (await account.authentication).idToken,
      //   accessToken: (await account.authentication).accessToken,
      // ));
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential res =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print("________${res.user}");
      if (res.user == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print(e);
      print("Error logging with google");
      return false;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
