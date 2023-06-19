import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';

class customInput extends StatelessWidget {
  customInput(
      {Key? key,
      required this.Text,
      this.Icon,
      this.controller,
      this.suffixIcon,
      this.keyboardType,
      this.minLines,
      this.maxLines,
      this.maxLenght,
      this.obscureText = false,
      this.onSaved,
this.validator  
      })
      : super(key: key);
  final String? Text;
  final Widget? Icon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final int? maxLenght;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLenght,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: Icon,
          labelText: Text,
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(1)))),
    );
  }
}

class customButton extends StatelessWidget {
  const customButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }
}

class chatwidget extends StatelessWidget {
  final String messageFromUser;
  final String messageFromMe;
  final String timeFromMe;
  final String timeFromUser;
  const chatwidget(
      {super.key,
      required this.messageFromUser,
      required this.messageFromMe,
      required this.timeFromMe,
      required this.timeFromUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(right: 80),
            child: Column(
              children: [
                ClipPath(
                  clipper: UpperNipMessageClipper(MessageType.receive),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0xFFE1E1E2),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(3, 3))
                        ]),
                    child: Text(
                      messageFromUser,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Text(timeFromUser)
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(left: 80, top: 20, bottom: 0),
            child: Column(
              children: [
                ClipPath(
                  clipper: LowerNipMessageClipper(MessageType.send),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Color(0xFF113953)),
                    child: Text(
                      messageFromMe,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                Text(timeFromMe)
              ],
            ),
          ),
        )
      ],
    );
  }
}
