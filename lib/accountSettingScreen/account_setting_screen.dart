import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class accountSettingScreen extends StatefulWidget {
  const accountSettingScreen({super.key});

  @override
  State<accountSettingScreen> createState() => _accountSettingScreenState();
}

class _accountSettingScreenState extends State<accountSettingScreen> {
  //we use next button to move from one page to another especially when user selects image and then click next to
  //go to next page
  bool uploading = false, next = false;
  final List<File> _image = [];
  List<String> urlList = [];
  double val = 0;
  chooseImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    //since we know we will be adding multiple images
    setState(() {
      _image.add(File(pickedFile!.path));
    });
  }

  uploadImage() async {
    int i = 1;
    // we are taking each image in the _image File
    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });
      // then we are assiging it with the unique name
      var refImages = FirebaseStorage.instance.ref().child(
          'Images/${DateTime.now().microsecondsSinceEpoch.toString()}.jpg');
      // then we are adding it in the urlList when uploading is completed and we get the url
      await refImages.putFile(img).whenComplete(() async {
        await refImages.getDownloadURL().then((urlImage) {
          urlList.add(urlImage);
        });
      });
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //if the next button is clicked then that means user slected the images or
          // displaying 5 images will be shown
          next ? "Profile Information" : "Choose 5 Images",
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          //if the next button is clicked then that means user slected the images or
          // displaying 5 images will be shown
          next
              ? Container()
              : IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                              child: Column(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Uploading Images....")
                            ],
                          ));
                        });
                    uploadImage();
                  },
                  icon: const Icon(
                    Icons.navigate_next_outlined,
                    size: 36,
                  ))
        ],
      ),
      body: next
          ? const SingleChildScrollView()
          : Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  child: GridView.builder(
                    itemCount: _image.length + 1,
                    // grid delegate means display 3 images in a row
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      // if index == 0 means user has not choosen any image
                      return index == 0
                          ? Container(
                              color: Colors.white30,
                              child: Center(
                                child: IconButton(
                                    // means if images are uploading user will not be allowed to insert further images
                                    onPressed: () {
                                      !uploading ? chooseImage() : null;
                                    },
                                    icon: const Icon(Icons.add)),
                              ),
                            )
                          : Container(
                              // we use this option when displaying images meaning they are already uploaded by user
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(_image[index - 1]),
                                      fit: BoxFit.cover)),
                            );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
