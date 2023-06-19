import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustudient/customWidget.dart';
import 'package:ustudient/pages/routes.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController name= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController number= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController state= TextEditingController();
  TextEditingController student_year= TextEditingController();
  bool obscuretext = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        customInput(
                          controller: name,
                          Text: "الاسم الكامل",
                          validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يجب إدخال الاسم الكامل';
                          }
                          return null;
                        },
                       
                          Icon: Icon(Icons.person_2_outlined),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customInput(
                          controller: state,
                          validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يجب إدخال اسم المحافظة';
                          }
                          return null;
                        },
                   
                            Text: "المحافظة", Icon: Icon(Icons.flag_outlined)),
                        SizedBox(
                          height: 10,
                        ),
                        customInput(
                         controller: student_year,
                          validator: (value) {
                          if (value == null || value.isEmpty || value.length >= 3) {
                            return 'يجب إدخال السنة الدراسية';
                          }
                          return null;
                        },
                        
                            keyboardType: TextInputType.number,
                            Text: "السنة الدراسية (ثانوية فقط)",
                            Icon: Icon(Icons.school)),
                        SizedBox(
                          height: 10,
                        ),
                        customInput(
                          controller: email,
                           validator: (value) {
                          if (value == null || value.isEmpty ) {
                            return 'يرجى إدخال البريد الإلكتروني';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'يرجى إدخال بريد إلكتروني صالح';
                          }
                          return null;
                        },
                            keyboardType: TextInputType.emailAddress,
                            Text: "البريد الالكتروني",
                            Icon: Icon(Icons.phone_outlined)),
                        SizedBox(
                          height: 10,
                        ),
                        customInput(
                          controller: number,
                          validator: (value) {
                          if (value == null || value.isEmpty || value.length >10 || value.length <12) {
                            return 'يجب إدخال رقم الهاتف صالح';
                          }
                          return null;
                        },
                  
                            keyboardType: TextInputType.number,
                            Text: "رقم الهاتف (يحب ان يبدء ب 0)",
                            Icon: Icon(Icons.email_outlined)),
                        SizedBox(
                          height: 10,
                        ),
                       TextFormField(
                        controller: password,
                         validator: (value) {
                          if (value == null || value.isEmpty ) {
                            return 'الرجاء إدخال كلمة مرور صالحة';
                          }
                          return null;
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
                              TextButton(
                                  onPressed: () {}, child: Text("تسجيل الدخول")),
                              Text("لديك حساب بالفعل؟"),
                            ],
                          ),
                        ),
                        customButton(text: "تسجيل", onPressed: _submit,),
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
          onPressed: _submit,
          child: isLoading ? Center(child: CircularProgressIndicator(),):Text(
           " تسجيل الدخول",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

   void _submit() async {
    if (_formKey.currentState!.validate()) {
            setState(() {
                          isLoading = !isLoading;
                        });
      _formKey.currentState!.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text,
                 password: password.text
                 );
        User? user = FirebaseAuth.instance.currentUser;
        String uid = user!.uid;
   await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name.text,
        'email': email.text,
        'number': number.text,
        'state': state.text,
        'student_year': student_year.text,
        'password': password.text,
      });        SharedPreferences prefs = await SharedPreferences.getInstance();
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
  }
}
