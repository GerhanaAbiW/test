// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// abstract class BaseAuth{
//   Future<FirebaseUser> googleSignIn();
// }

// class Auth implements BaseAuth{
//   FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   @override
//   Future<FirebaseUser> googleSignIn() async{
//     // TODO: implement googleSignIn
//     final GoogleSignIn googleSignIn = new GoogleSignIn();
//     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//     GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//     final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
//     try{
//       FirebaseUser user = (await _firebaseAuth.signInWithCredential(credential)).user;//await _firebaseAuth.signInWithCredential(credential);
//       return user;
//     }catch(e){
//       print(e.toString());
//       return null;
//     }

//   }

// }