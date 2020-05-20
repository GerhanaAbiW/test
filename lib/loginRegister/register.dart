import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hydroponic/commons.dart';
import 'package:hydroponic/dataBase/auth.dart';
import 'package:hydroponic/dataBase/users.dart';
import 'package:hydroponic/loading.dart';
import 'package:hydroponic/loginRegister/login.dart';
import 'package:hydroponic/mainMenu/mainMenu.dart';
import 'package:hydroponic/provider/provider.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _confirmPasswordTextController = TextEditingController();
  final _key = GlobalKey<ScaffoldState>();
  String gender;
  String groupValue = "male";
  bool hidePass = true;
  Auth auth = Auth();

//this is for tutorial first opening the app
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      body: user.status==Status.Aunthenticating?Loading():Stack(
        key: _key,
        children: <Widget>[
          Image.asset(
            "images/login/login.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset("images/logo/logo.jpg", width: 280, height: 240),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _name,
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  icon: Icon(Icons.person_outline),
                                  border: InputBorder.none,
                                  //border: OutlineInputBorder()
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "the name filed cannot be empty";
                                  } else if (value.length < 6) {
                                    return "the name has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                              ),
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: new Container(
                          color: Colors.white.withOpacity(0.5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: ListTile(
                                title: Text(
                                  "Male",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Radio(
                                    value: "male",
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChange(e)),
                              )),
                              Expanded(
                                  child: ListTile(
                                title: Text(
                                  "Female",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Radio(
                                    value: "female",
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChange(e)),
                              )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _email,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.email),
                                  border: InputBorder.none,
                                  //border: OutlineInputBorder()
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return "Please make sure your email address is valid";
                                    else
                                      return null;
                                  }
                                },
                              ),
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _password,
                                  obscureText: hidePass,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none,
                                    //border: OutlineInputBorder()
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "the password filed cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    }),
                              ),
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _confirmPasswordTextController,
                                  obscureText: hidePass,
                                  decoration: InputDecoration(
                                    hintText: " Confirm password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none,
                                    //border: OutlineInputBorder()
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "the password filed cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    } else if (_confirmPasswordTextController
                                            .text !=
                                        value) {
                                      return "the passwords do not match";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    }),
                              ),
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.green.withOpacity(0.8),
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () async {
                                if(_formKey.currentState.validate()){
                                  if(!await user.sigUp(_name.text,_email.text,_password.text))
                                    _key.currentState.showSnackBar(SnackBar(content: Text("sign up failed"),));
                                }
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Register",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "I already have an account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.green[700], fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Or Sign up with",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              child: MaterialButton(
                                onPressed: () {},
                                child: Image.asset(
                                  "images/fb.jpg",
                                  width: 60,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              child: MaterialButton(
                                onPressed: () async {
                                  FirebaseUser user = await auth.googleSignIn();
                                  _userServices.createUser({
                                    "name" : user.displayName,
                                    "photo" : user.photoUrl,
                                    "email" : user.email,
                                    "userId" : user.uid
                                  });
                                  changeScreenReplacement(context, MainMenu());
                                },
                                child: Image.asset(
                                  "images/google.jpg",
                                  width: 60,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  valueChange(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

//  Future validateForm() async {
//    FormState formState = _formKey.currentState;
//    Map value;
//    if (formState.validate()) {
//      formState.reset();
//      FirebaseUser user = await firebaseAuth.currentUser();
//      if (user == null) {
//        firebaseAuth
//            .createUserWithEmailAndPassword(
//                email: _emailTextController.text,
//                password: _passwordTextController.text)
//            .then((user) => {
//                  Firestore.instance.collection("users").add({
//                    "username": _nameTextController.text,
//                    "email": _emailTextController.text,
//                    "userId": user.user.uid,
//                    "gender": gender,
//                  })
//                })
//            .catchError((err) => {print(err.toString())});
//        Navigator.pushReplacement(
//            context, MaterialPageRoute(builder: (context) => LoginPage()));
//      }
//    }
//  }
}
