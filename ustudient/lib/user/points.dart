import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class points extends StatefulWidget {
  const points({super.key});

  @override
  State<points> createState() => _pointsState();
}

class _pointsState extends State<points> {
  var tab = 1;
  var codeShare = "saifger20dsa4329";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 216, 216),
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 34, 76, 98),
                      Colors.blueGrey,
                      Colors.blueGrey,
                      const Color.fromARGB(255, 34, 76, 98)
                    ])),
              ),
              Positioned(
                  top: 0,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ))),
              Positioned(
                  top: 50,
                  left: 10,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/user.png"),
                  )),
              Positioned(
                  top: 50,
                  right: 10,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_box,
                        color: Colors.white,
                      ))),
              Positioned(
                  top: 50,
                  left: 200,
                  child: Container(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/coins.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "100",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        )
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: 25,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          tab = 1;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("My Points")))),
              Positioned(
                  bottom: 0,
                  left: 220,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          tab = 2;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Share App")))),
              Positioned(
                  bottom: 0,
                  right: 25,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          tab = 3;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("View Ads")))),
            ],
          ),
          if (tab == 1)
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("points $index"),
                  );
                },
              ),
            ),
          if (tab == 2)
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "1 Referral = 5 pounds",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Text(
                    "You Can win 100 coin and up if invit firends",
                    style: TextStyle(color: Color.fromARGB(255, 107, 106, 106)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    child: Text("REFERRAL CODE"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50, right: 50),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(29, 255, 255, 0),
                        border: Border.all(width: 1, color: Colors.yellow)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("$codeShare"),
                        ),
                        IconButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: codeShare));
                            },
                            icon: Icon(Icons.copy))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Do You have any referral code?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 107, 106, 106)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {}, child: Text("Redeem Code")),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 25),
                          height: height / 4,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 10, left: 10),
                                padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(125, 255, 255, 255),
                                    border: Border.all(
                                        width: 1,
                                        color: Color.fromARGB(
                                            255, 197, 195, 195))),
                                child: ListTile(
                                  leading: Icon(Icons.person),
                                  title: Text("person name"),
                                  subtitle: Text("invite from you"),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          if (tab == 3)
            Container(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    height: height/1.5,
                    child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("data"),
                        
                      );
                    },
                  ))
                ],
              ),
            ),
        ],
      )),
    );
  }
}
