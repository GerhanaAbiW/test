// import 'package:flutter/material.dart';
// import 'package:hydroponic/loginRegister/register.dart';
// import 'package:hydroponic/mainMenu/mainMenu.dart';
// import 'package:hydroponic/menuHealty/healtyPage.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hydroponic/menuMarket/market.dart';
// import 'package:hydroponic/provider/provider.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _key = GlobalKey<ScaffoldState>();
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _email = TextEditingController();
//   TextEditingController _password = TextEditingController();

// //  SharedPreferences preferences; //this is for tutorial first opening the app
// //  bool loading = false;
// //  bool isLogedin = false;


// //  @override
// //  void initState() {
// //    super.initState();
// //    isSignIn();
// //  }
// //
// //  void isSignIn() async {
// //    setState(() {
// //      loading = true;
// //    });
// //   await firebaseAuth.currentUser().then((user){
// //      if(user !=null){
// //        setState(()=>isLogedin=true);
// //      }
// //    });
// //    preferences = await SharedPreferences.getInstance(); //await for hold ON for data prepare
// //    isLogedin = await googleSignIn.isSignedIn();
// //    if (isLogedin == true) {
// //      Navigator.pushReplacement(
// //          context, MaterialPageRoute(builder: (context) => MainMenu()));
// //    }
// //    setState(() {
// //      loading = false;
// //    });
// //  }

// //  Future handleSignIn() async {
// //    preferences = await SharedPreferences.getInstance();
// //
// //    setState(() {
// //      loading = true;
// //    });
// //    GoogleSignInAccount googleUser = await googleSignIn.signIn();
// //    GoogleSignInAuthentication googleSignInAuthentication = await googleUser
// //        .authentication;
// //    AuthCredential credential = GoogleAuthProvider.getCredential(
// //        idToken: googleSignInAuthentication.idToken,
// //        accessToken: googleSignInAuthentication.accessToken);
// //    FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(
// //        credential)).user;
// //    if (firebaseUser != null) {
// //      final QuerySnapshot result = await Firestore.instance.collection("user")
// //          .where("id", isEqualTo: firebaseUser.uid)
// //          .getDocuments();
// //      final List<DocumentSnapshot> documents = result.documents;
// //
// //      if (documents.length == 0) {
// //        Firestore.instance.
// //        collection("users").
// //        document(firebaseUser.uid)
// //            .setData({
// //          "id": firebaseUser.uid,
// //          "userName": firebaseUser.displayName,
// //          "profilePicture": firebaseUser.photoUrl
// //        });
// //        await preferences.setString("id", firebaseUser.uid);
// //        await preferences.setString("userName", firebaseUser.displayName);
// //        await preferences.setString("profilePicture", firebaseUser.photoUrl);
// //      } else {
// //        await preferences.setString("id", documents[0]["id"]);
// //        await preferences.setString("userName", documents[0]["userName"]);
// //        await preferences.setString(
// //            "profilePicture", documents[0]["profilePicture"]);
// //      }
// //      Fluttertoast.showToast(msg: "Login Was Successful");
// //      setState(() {
// //        loading = false;
// //      });
// //      Navigator.pushReplacement(
// //          context, MaterialPageRoute(builder: (context) => MainMenu()));
// //    } else {
// //      Fluttertoast.showToast(msg: "Login failed");
// //    }
// //  }


//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserProvider>(context);
//     return Scaffold(
//       key: _key,
//         body: Stack(
//           children: <Widget>[
//             Image.asset(
//               "images/login/login.jpg",
//               fit: BoxFit.fill,
//               width: double.infinity,
//               height: double.infinity,),
//             Container(
//               color: Colors.black.withOpacity(0.4),
//               width: double.infinity,
//               height: double.infinity,),
//             Container(
//               alignment: Alignment.topCenter,
//               child: Image.asset(
//                   "images/logo/logo.jpg", width: 280, height: 240),
//             ),

//             Padding(
//               padding: const EdgeInsets.only(top: 200.0),
//               child: Center(
//                 child: Form(
//                     key: _formKey,
//                     child: ListView(
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(
//                               14.0, 8.0, 14.0, 8.0),
//                           child: Material(
//                               borderRadius: BorderRadius.circular(10.0),
//                               color: Colors.white.withOpacity(0.8),
//                               elevation: 0.0,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 12.0),
//                                 child: TextFormField(
//                                   controller: _email,
//                                   decoration: InputDecoration(
//                                     hintText: "Email",
//                                     icon: Icon(Icons.email),
//                                     //border: OutlineInputBorder()
//                                   ),
//                                   validator: (value) {
//                                     if (value.isEmpty) {
//                                       Pattern pattern =
//                                           r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                                       RegExp regex = new RegExp(pattern);
//                                       if (!regex.hasMatch(value))
//                                         return "Please make sure your email address is valid";
//                                       else
//                                         return null;
//                                     }
//                                   },
//                                 ),
//                               )
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(
//                               14.0, 8.0, 14.0, 8.0),
//                           child: Material(
//                               borderRadius: BorderRadius.circular(10.0),
//                               color: Colors.white.withOpacity(0.8),
//                               elevation: 0.0,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 12.0),
//                                 child: TextFormField(
//                                   controller: _password,
//                                   decoration: InputDecoration(
//                                     hintText: "Password",
//                                     icon: Icon(Icons.lock_outline),
//                                     //border: OutlineInputBorder()
//                                   ),
//                                   validator: (value) {
//                                     if (value.isEmpty) {
//                                       return "the password filed cannot be empty";
//                                     } else if (value.length < 6) {
//                                       return "the password has to be at least 6 characters long";
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               )
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(
//                               14.0, 8.0, 14.0, 8.0),
//                           child: Material(
//                               borderRadius: BorderRadius.circular(20.0),
//                               color: Colors.green.withOpacity(0.8),
//                               elevation: 0.0,
//                               child: MaterialButton(onPressed: () async {
//                                 if(_formKey.currentState.validate()){
//                                   if(!await user.sigIn(_email.text,_password.text))
//                                     _key.currentState.showSnackBar(SnackBar(content: Text("sign in failed"),));
//                                 }
//                               },
//                                 minWidth: MediaQuery
//                                     .of(context)
//                                     .size
//                                     .width,
//                                 child: Text("Login",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20.0),),)
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text("Forgot password",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
//                             },
//                             child: Text("Sign up",textAlign: TextAlign.center, style: TextStyle(
//                                 color: Colors.green[700]),),
//                           ),
//                         ),
//                         Expanded(child: Container(),),
//                         Divider(color: Colors.white,),
//                         Text("Other login option", style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 22.0),),


//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             Padding(
//                               padding:
//                               const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                               child: Material(
//                                 child: MaterialButton(
//                                   onPressed: () {},
//                                   child: Image.asset(
//                                     "images/fb.jpg",
//                                     width: 60,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                               const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                               child: Material(
//                                 child: MaterialButton(
//                                   onPressed: () {
//                                     //handleSignIn();
//                                   },
//                                   child: Image.asset(
//                                     "images/google.jpg",
//                                     width: 60,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
// //                        Padding(
// //                          padding: const EdgeInsets.all(8.0),
// //                          child: Material(
// //                              borderRadius: BorderRadius.circular(20.0),
// //                              color: Colors.blue.withOpacity(0.8),
// //                              elevation: 0.0,
// //                              child: MaterialButton(onPressed: () {
// //                                handleSignIn();
// //                              },
// //                                minWidth: MediaQuery
// //                                    .of(context)
// //                                    .size
// //                                    .width,
// //                                child: Text("Google",
// //                                  textAlign: TextAlign.center,
// //                                  style: TextStyle(color: Colors.white,
// //                                      fontWeight: FontWeight.bold,
// //                                      fontSize: 22.0),),)
// //                          ),
// //                        )
//                       ],)),
//               ),
//             ),

// //
// //            Visibility(
// //              visible: loading ?? true,
// //              child: Center(
// //                child: Container(
// //                  alignment: Alignment.center,
// //                  color: Colors.white.withOpacity(0.9),
// //                  child: CircularProgressIndicator(
// //                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
// //                  ),
// //                ),
// //              ),
// //            )
//           ],
//         ),

//     );
//   }

// }

// //  Widget buildTextField(String hintText) {
// //    return TextField(
// //      decoration: InputDecoration(
// //        hintText: hintText,
// //        hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
// //        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
// //        prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
// //        suffixIcon: hintText == "Password"
// //            ? IconButton(
// //                onPressed: _toggleVisibility,
// //                icon: _isHidden
// //                    ? Icon(Icons.visibility_off)
// //                    : Icon(Icons.visibility),
// //              )
// //            : null,
// //      ),
// //      obscureText: hintText == "Password" ? _isHidden : false,
// //    );
// //  }

// //  Widget buildButtonContainer() {
// //      return Container(
// //      height: 56.0,
// //      width: MediaQuery.of(context).size.width,
// //      decoration: BoxDecoration(
// //        borderRadius: BorderRadius.circular(23.0),
// //        gradient: LinearGradient(
// //            colors: [Color(0xFF7CB342), Color(0xFF7CB342)],
// //            begin: Alignment.centerRight,
// //            end: Alignment.centerLeft),
// //      ),
// //      child: Center(
// //        child:FlatButton(
// //          onPressed: () =>{
// //            Navigator.push(context, MaterialPageRoute(builder: (context) {
// //              return MenuMarket();
// //            })),
// //          },
// //          child: Text(
// //            "LOGIN",
// //            style: TextStyle(
// //              color: Colors.white,
// //              fontSize: 18.0,
// //
// //            ),
// //          ),
// //
// //        ),
// //      ),
// //    );
// //  }


// //keyboardType: TextInputType.emailAddress,
// //controller: _emailTextController,
// //
