import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_player/video_player.dart';

class new_post extends StatefulWidget {
  new_post({
    Key? key,
  }) : super(key: key);

  @override
  State<new_post> createState() => _new_postState();
}

class _new_postState extends State<new_post> {
  int _maxImages = 4;
  List<File> _images = [];
  VideoPlayerController? _videoPlayerController;

  Future<void> _pickImage() async {
    if (_images.length >= _maxImages) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم تحديد الحد الأقصى لعدد الصور'),
        ),
      );
      return;
    }

    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _pcikPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      // تم اختيار ملف(أو ملفات) بنجاح
      int numberOfFiles = result.count;
      print('تم اختيار $numberOfFiles ملف(أو ملفات)');
    } else {}
  }

  Future<void> _pickVideo() async {
    if (_images.length >= _maxImages) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم تحديد الحد الأقصى لعدد للفيديوهات'),
        ),
      );
      return;
    }

    final picker = ImagePicker();
    final pickedFile = await picker.getVideo(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Add Post",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: _pickImage,
              icon: Icon(
                Icons.add_a_photo_outlined,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                color: Colors.black,
              )),
        ],
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(
                      hintText: "enter text",
                      hintStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)))),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => _pickImage(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.photo_size_select_actual_rounded,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("صورة")
                            ],
                          )),
                      GestureDetector(
                          onTap: () => _pickVideo(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.videocam_rounded,
                                color: Color.fromARGB(181, 3, 187, 9),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("فيديو")
                            ],
                          )),
                      GestureDetector(
                          onTap: () => _pcikPdf(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.insert_drive_file,
                                color: Colors.redAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Pdf ملف")
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
            _images != false
                ? Expanded(
                    child: GridView.builder(
                    itemCount: _images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      final mediaFile = _images[index];
                       if (mediaFile.path.endsWith('.mp4')) {
      // إذا كان الملف ملف فيديو
      _videoPlayerController = VideoPlayerController.file(mediaFile)..initialize();
      return Container(
        height: 200,
        child: _videoPlayerController!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController!.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController!),
              )
            : Container(),
      );
    }else{ return Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(
                                  _images[index],
                                ),
                                fit: BoxFit.cover)),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _images.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.close)))
                          ],
                        ),
                      );}}
                  ))
                : Container(),
          ],
        ),
      )),
    );
  }
}
