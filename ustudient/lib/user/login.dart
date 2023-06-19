import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustudient/customWidget.dart';
import 'package:ustudient/pages/routes.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email, _password;

  bool obscuretext = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      customInput(
                         onSaved: (value) {
                          _email = value;
                        },
                       validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال البريد الإلكتروني';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'يرجى إدخال بريد إلكتروني صالح';
                          }
                          return null;
                        },
                          keyboardType: TextInputType.emailAddress,
                          Text: "البريد الالكتروني",
                          Icon: Icon(Icons.email_outlined),
                          ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                         validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال كلمة مرور صالحة';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                        obscureText: obscuretext,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscuretext = !obscuretext;
                                  });
                                },
                                icon: obscuretext == true
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off)),
                            prefixIcon: Icon(Icons.password),
                            labelText: "كلمة السر",
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(1)))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: () {}, child: Text("إسترجاع الحساب")),
                            Text("ققدت الوصول لحسابك؟"),
                          ],
                        ),
                      ),

                      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            // color: Color.fromARGB(255, 100, 32, 236),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 153, 103, 253),
              Color.fromARGB(255, 100, 32, 236),
              Color.fromARGB(255, 169, 134, 238)
            ])),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () async{
                    
                        if (_formKey.currentState!.validate()) {
                              setState(() {
                          isLoading = !isLoading;
                        });
      _formKey.currentState!.save();
      try {
        // ignore: unused_local_variable
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _email!,
                 password: _password!
                 );
        User? user = FirebaseAuth.instance.currentUser;
        String uid = user!.uid;
        SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setBool('isUserLoggedIn', true);
prefs.setString("uid", uid);
navigator!.pushReplacement(MaterialPageRoute(builder: (context)=> routes()));
        } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('لا يوجد مستخدم بهذا البريد الإلكتروني.');
        } else if (e.code == 'wrong-password') {
          print('كلمة المرور غير صحيحة.');
        }
      }
    }
  },
          child: isLoading ? Center(child: CircularProgressIndicator(),):Text(
           " تسجيل الدخول",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text("أو")),
                      customButton(
                          text: "ألتسجيل",
                          onPressed: () {
                            Get.toNamed("/register");
                          }),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
