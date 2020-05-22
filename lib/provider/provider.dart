
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:hydroponic/dataBase/users.dart';

// enum Status{Uninitialized, Authenticated, Aunthenticating, Unaunthenticated}

// class UserProvider with ChangeNotifier{
//   FirebaseAuth _auth;
//   FirebaseUser _user;
//   Status _status = Status.Uninitialized;
//   Status get status => _status;
//   FirebaseUser get user => _user;
//   UserServices _userServices;
//   UserProvider.initialize() : _auth = FirebaseAuth.instance{
//     _auth.onAuthStateChanged.listen(_onStateChanged);
//   }

//   Future<bool>sigIn(String email, String password) async {
//     try{
//       _status = Status.Aunthenticating;
//       notifyListeners();
//       await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user){
//         Map<String, dynamic>values={
//           "email" : email,
//           "userId" : user.user.uid
//         };
//         _userServices.createUser(values);
//       });
//       return true;
//     }catch(e){
//       _status = Status.Authenticated;
//       notifyListeners();
//       print(e.toString());
//       return false;
//     }
//   }
//   Future<bool>sigUp(String name,String email, String password) async {
//     try{
//       _status = Status.Aunthenticating;
//       notifyListeners();
//       await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user){
//         Map<String, dynamic>values={
//           "name" : name,
//           "email" : email,
//           "userId" : user.user.uid
//         };
//         _userServices.createUser(values);
//       });
//       return true;
//     }catch(e){
//       _status = Status.Authenticated;
//       notifyListeners();
//       print(e.toString());
//       return false;
//     }
//   }

//   Future signOut()async{
//     _auth.signOut();
//     _status = Status.Unaunthenticated;
//     notifyListeners();
//     return Future.delayed(Duration.zero);
//   }



//   Future<void> _onStateChanged(FirebaseUser user) async{
//     if(user==null){
//       _status = Status.Unaunthenticated;
//     }else{
//       _user = user;
//       _status = Status.Authenticated;
//     }
//     notifyListeners();
//   }
// }