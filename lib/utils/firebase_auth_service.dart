import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  FirebaseAuth _auth;
  GoogleSignIn googleSignIn;
//  FacebookLogin facebookLogin;
  FirebaseAuthService() {
    _auth = FirebaseAuth.instance;
    googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
//    facebookLogin = new FacebookLogin();
  }

  Future<void> signUpWithFirebaseEmailAndPassword(email, password) async {
    try {
      AuthCredential credential =
          await EmailAuthProvider.credential(email: email, password: password);
      final User currentUser = await getFirebaseUser();
      await currentUser.linkWithCredential(credential);
    } catch (e) {
      return null;
    }
  }

  Future<void> signInWithFirebaseEmailAndPassword(email, password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {}
  }

  Future<void> signInWithPhone(
      {String phoneNumber,
      Function onCodeSent,
      Function onPhoneVerified,
      int forceResendingToken}) async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: Duration(minutes: 1),
          verificationCompleted: (PhoneAuthCredential credential) async {
            final result = await _auth.signInWithCredential(credential);
            await onPhoneVerified(result.user.uid);
          },
          verificationFailed: (FirebaseAuthException error) {},
          codeSent: onCodeSent,
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationId = verificationId;
          },
          forceResendingToken: forceResendingToken);
    } catch (e) {
      print(e);
    }
  }

  void logOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();
  }

  Future<String> signInWithGoogle() async {
    String firebaseId;
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;
    firebaseId = user.uid;
    return firebaseId;
  }

  Future getFirebaseUser() async {
    User currentUser = await _auth.currentUser;
    return currentUser;
  }
}
