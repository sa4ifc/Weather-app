import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:ustudient/pages/books.dart';
import 'package:ustudient/pages/newpost.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  String uid = " ";
  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_uid = prefs.getString('uid') ?? '';
    setState(() {
      uid = user_uid;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  bool isActivebutton1 = false;
  bool isActivebutton2 = false;
  bool isActivebutton3 = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Ustudient",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
              icon: Icon(Icons.widgets, color: Colors.black)),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(10),
              // decoration: BoxDecoration(),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  "اهلا , سيف",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "هل ترغب بمشاركة شئ؟",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.only(left: 5,right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.to(new_post());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.photo_size_select_actual_rounded,
                                color: Colors.blue,
                              ),SizedBox(width: 5,),
                              Text("صورة")
                            ],
                          )),
                           GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.videocam_rounded,
                                color: Color.fromARGB(181, 3, 187, 9),
                              ),SizedBox(width: 5,),
                              Text("فيديو")
                            ],
                          )),
                           GestureDetector(
                          onTap: () {
                            Get.to(new_post());
                       
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.insert_drive_file,
                                color: Colors.redAccent,
                              ), SizedBox(width: 5,),
                              Text("Pdf ملف")
                            ],
                          )),
                    ],
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    "اشخاص تتابعهم",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                      height: height / 9,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.black, width: 3)),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage("assets/user.png"),
                                  ),
                                ),
                                Text("data")
                              ],
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Container(
                  margin: EdgeInsets.only(left: 50, right: 50),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      // color: Color.fromARGB(159, 99, 97, 104),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: 7, top: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isActivebutton1
                                ? Color.fromARGB(255, 191, 170, 249)
                                : Colors.white),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isActivebutton1 = !isActivebutton1;
                                isActivebutton2 = false;
                                isActivebutton3 = false;
                              });
                            },
                            child: Text("جروبات")),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: 7, top: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isActivebutton2
                                ? Color.fromARGB(255, 191, 170, 249)
                                : Colors.white),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isActivebutton2 = !isActivebutton2;
                                isActivebutton1 = false;
                                isActivebutton3 = false;
                              });
                            },
                            child: Text("تتابعه")),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: 7, top: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isActivebutton3
                                ? Color.fromARGB(255, 191, 170, 249)
                                : Colors.white),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isActivebutton1 = false;
                                isActivebutton2 = false;
                                isActivebutton3 = !isActivebutton3;
                              });
                            },
                            child: Text("العام")),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final datafind = snapshot.data!.docs;
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: datafind.length,
                        itemBuilder: (context, index) {
                          final data = datafind[index];

                          final images = [
                            "assets/user.png",
                            "assets/user.png",
                            "assets/user.png",
                            "assets/user.png",
                          ];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage:
                                                  AssetImage("assets/user.png"),
                                                  backgroundColor: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "${data['name']}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20
                                                        ),
                                                  ),
                                                ),
                                                 Text(
                                          "30 APR, 2023",
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 12),
                                        )
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.more_horiz)),
                                          ],
                                        )),
                                  
                                    Text(
                                      "descript test descript test descript test descript test descript testdescript testdescript test",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Wrap(
                                      spacing: 5, // المسافة الأفقية بين الصور
                                      runSpacing:
                                          5, // المسافة العمودية بين الصور
                                      children: images.map((image) {
                                        return GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  child: Image.asset(
                                                    image,
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Image.asset(
                                            image,
                                            fit: BoxFit
                                                .cover, // تحديد كيفية عرض الصور
                                            width: 100, // تحديد عرض الصور
                                            height: 100, // تحديد ارتفاع الصور
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          
                                          children: [
                                          Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {},
                                                child: FaIcon(FontAwesomeIcons.heart)),
                                          SizedBox(
                                              width: 10,
                                            ),  Text("10"),
                                          ],
                                        ),
                                        SizedBox(width: 20,),
                                        Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {},
                                                child: FaIcon(FontAwesomeIcons.comment)),
                                           SizedBox(
                                              width: 10,
                                            ), Text("10"),
                                            
                                          ],
                                        )
                                        ],),
                                        Row(children: [
                                           GestureDetector(
                                                onTap: () {},
                                                child: Icon(Icons.bookmark_outline)),
                                        ],)
                                      ],
                                    ),
                                    Divider()
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(uid)
                .snapshots(),
            builder: (context, snapshot) {
              final data = snapshot.data!.data()!;
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  UserAccountsDrawerHeader(
                    accountName:
                        Text("${data['name'] != null ? data['name'] : " "}"),
                    accountEmail:
                        Text("${data['email'] != null ? data['email'] : " "}"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("assets/user.png"),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(188, 123, 94, 25),
                        Color.fromARGB(187, 158, 118, 25),
                      ]),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.topRight,
                      child: Text("كورساتك")),
                  Divider(),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          // height: 120,
                          // color: Color.fromARGB(255, 218, 218, 218),
                          child: SleekCircularSlider(
                            initialValue: 10,
                            innerWidget: (value) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${value.toInt()}%"),
                                    Text(
                                      "Arabic",
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.book,
                    ),
                    title: const Text('كتب'),
                    onTap: () {
                      Get.to(() => books(), transition: Transition.zoom);
                    },
                  ),
                  //  data['ListTile'] as Widget,
                  ListTile(
                    enabled: false,
                    leading: Icon(
                      Icons.attach_money,
                    ),
                    title: const Text('نقاطك'),
                    onTap: () {
                      Get.toNamed("/points");
                    },
                  ),
                  ListTile(
                    enabled: false,
                    leading: Icon(Icons.timer),
                    title: const Text('Chat AI'),
                    subtitle: Text("قريبا"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  ListTile(
                    enabled: false,
                    leading: Icon(
                      Icons.language,
                    ),
                    title: const Text('Language'),
                    subtitle: Text("قريبا"),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("change Language"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text("اللغة العربية")),
                                  ElevatedButton(
                                      onPressed: () {}, child: Text("English"))
                                ],
                              ));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                    ),
                    title: const Text('تسجيل الخروج'),
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool("isUserLoggedIn", false);
                      prefs.remove("uid");
                      Get.offAllNamed("/login");
                    },
                  )
                ],
              );
            },
          )
        ]),
      ),
    );
  }
}
