import 'package:flutter/material.dart';
import 'package:get/get.dart';

class messages extends StatefulWidget {
  const messages({super.key});

  @override
  State<messages> createState() => _messagesState();
}

class _messagesState extends State<messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
        
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          
              ),
              
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: (){
                  Get.toNamed("/chat");
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/user.png",
                      width: 55,
                      height: 55,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "data",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "10:35 pm",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  subtitle: Text(
                    "data data data data data data",
                    maxLines: 1,
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
