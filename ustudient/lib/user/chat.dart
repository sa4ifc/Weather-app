import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ustudient/customWidget.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {navigator!.pop(context);},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title:Row(
            children: [
               CircleAvatar(
                backgroundImage: AssetImage("assets/user.png"),
                backgroundColor: const Color.fromARGB(0, 255, 153, 0),
              ),
              SizedBox(width: 10,),
              Text(
                "User Name",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
             
            ],
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded,color: Colors.black,))
          ],
        ),
      
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              reverse: true,
              itemBuilder: (context, index) {
              return   chatwidget(
                  messageFromMe: 'how are you',
                  timeFromMe: "10",
                  messageFromUser: 'im fine',
                  timeFromUser: "20",
                );
            },),
          ),
          Container(
      height: 65,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3))
      ]),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Icon(Icons.add),
          ),
        Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Type A Message", border: InputBorder.none),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.send),
          ),
        ],
      ),
    )
        ],
      ),
    );
  }
}