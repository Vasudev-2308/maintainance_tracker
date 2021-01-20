import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _signIn = GoogleSignIn();

Future<User> signInwithGoogle() async {
  GoogleSignInAccount googleSignInAccount = await _signIn.signIn();
  GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken);

  final UserCredential result = await _auth.signInWithCredential(credential);
  final User user = result.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final User currentUser = _auth.currentUser;
  assert(currentUser.uid == user.uid);

  return user;
}

void signOut() {
  _signIn.signOut();
}
