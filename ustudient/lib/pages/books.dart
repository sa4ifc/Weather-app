import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ustudient/customWidget.dart';

class books extends StatefulWidget {
  const books({super.key});

  @override
  State<books> createState() => _booksState();
}

class _booksState extends State<books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(70, 216, 216, 216),
     appBar: AppBar(
      elevation: 0,
      leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      backgroundColor: Color.fromARGB(0, 26, 65, 27),
      title: Container(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "search",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.all( Radius.circular(10)))
            ),
          ),
        ),
     ),
      body: Container(
        child: Column(
          children: [
             
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sat, 4 April 2023 | 3.15 PM",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Divider(),
                          ListTile(
                            leading: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/user.png",
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            title: Container(
                                alignment: Alignment.topRight,
                                child: Text("اللغة العربية ")),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              textDirection: TextDirection.rtl,
                              children: [
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Text(": الناشر"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text("Saif Mohammed")),
                                  ],
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Text(": بتاريخ"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("25/7/2004"),
                                  ],
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Text(": القيمة"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("مجاني"),
                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Download")))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
