import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investorapp/global.dart';
import 'package:investorapp/homseScreen/home_screen.dart';
import 'package:investorapp/widget/custom_text_field_widget.dart';
import 'package:investorapp/components/text_Editing_controllers.dart';
import 'package:investorapp/controllers/authentication_controller.dart';
import '../components/text_Editing_controllers.dart';
import 'package:investorapp/widget/custom_text_field_widget.dart';
import 'package:get/get.dart';

class accountSettingScreen extends StatefulWidget {
  const accountSettingScreen({super.key});

  @override
  State<accountSettingScreen> createState() => _accountSettingScreenState();
}

class _accountSettingScreenState extends State<accountSettingScreen> {
  bool showProgressBar = false;
  var authController = AuthenticatorController.authenticatorController;
  double _getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width - 36;
  }

// Personal info
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController lookingForInAPartner = TextEditingController();
  TextEditingController ProfileHeading = TextEditingController();

  // Appearance
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController bodyType = TextEditingController();

  // LifeStyle
  TextEditingController drink = TextEditingController();
  TextEditingController smoke = TextEditingController();
  TextEditingController maritalStatus = TextEditingController();
  TextEditingController haveChildren = TextEditingController();
  TextEditingController numberOfChildren = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController income = TextEditingController();
  TextEditingController livingSituation = TextEditingController();
  TextEditingController willingToRelocate = TextEditingController();
  TextEditingController relationshipYouAreLookingFor = TextEditingController();

  // Cultural Choices
  TextEditingController nationality = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController religion = TextEditingController();
  TextEditingController ethnicity = TextEditingController();

  TextEditingControllers usercontrollers = TextEditingControllers();

  // //then for aassinging  the old data to variable we will add:
  // String _email = "";
  // String _imageProfile = "";
  // String _name = "";
  // String _phoneNumber = "";
  // String _age = "";
  // String _city = "";
  // String _country = "";
  // String _lookingForInAPartner = "";
  // String _profileHeading = "";
  // String _publishedDateTime = "";
  // String _height = "";
  // String _weight = "";
  // String _bodyType = "";
  // String _drink = "";
  // String _smoke = "";
  // String _maritalStatus = "";
  // String _haveChildren = "";
  // String _numberOfChildren = "";
  // String _profession = "";
  // String _income = "";
  // String _livingSituation = "";
  // String _willingToRelocate = "";
  // String _relationshipYouAreLookingFor = "";
  // String _nationality = "";
  // String _education = "";
  // String _language = "";
  // String _religion = "";
  // String _ethnicity = "";
  String ages = "";
  String profileHeading = "";

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

  retrieveUserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserId)
        .get()
        .then((snapshot) {
      // then we are checking that if user is applying to update does it exist or not
      if (snapshot.exists) {
        setState(() {
          // then assign each value to controller so that we can display it
          name = snapshot.data()!['name'];
          usercontrollers.name.text = name as String;

          // imageProfile= snapshot.data()!['imageProfile'];
          email = snapshot.data()!['email'];
          usercontrollers.email.text = email as String;
          phoneNumber = snapshot.data()!['phoneNumber'];
          usercontrollers.phoneNumber.text = phoneNumber.toString();
          // password= snapshot.data()!['password'];
          // age = int.parse(snapshot.data()!['age']).toString();
          ages = snapshot.data()!['age'].toString();

          city = snapshot.data()!['city'];
          country = snapshot.data()!['country'];
          lookingForInAPartner = snapshot.data()!['lookingForInAPartner'];
          profileHeading = snapshot.data()!['profileHeading'];
          // publishedDateTime = snapshot.data()!['publishedDateTime'].toString();
//appearance
          height = snapshot.data()!['height'];
          weight = snapshot.data()!['weight'];
          bodyType = snapshot.data()!['bodyType'];

// LifeStyle
          drink = snapshot.data()!['drink'];
          smoke = snapshot.data()!['smoke'];
          maritalStatus = snapshot.data()!['maritalStatus'];
          haveChildren = snapshot.data()!['haveChildren'];
          numberOfChildren = snapshot.data()!['numberOfChildren'];
          profession = snapshot.data()!['profession'];
          income = snapshot.data()!['income'];
          livingSituation = snapshot.data()!['livingSituation'];
          willingToRelocate = snapshot.data()!['willingToRelocate'];
          relationshipYouAreLookingFor =
              snapshot.data()!['relationshipYouAreLookingFor'];

          // Cultural Choices
          nationality = snapshot.data()!['nationality'];
          education = snapshot.data()!['education'];
          language = snapshot.data()!['language'];
          religion = snapshot.data()!['religion'];
          ethnicity = snapshot.data()!['ethnicity'];
        });
      }
    });
  }

  updateUserDataToFireStoreDatabase(
      String name,
      String phoneNumber,
      String age,
      String city,
      String country,
      String lookingForInAPartner,
      String profileHeading,
      // DateTime? publishedDateTime,
      String height,
      String weight,
      String bodyType,
      String drink,
      String smoke,
      String maritalStatus,
      String haveChildren,
      String numberOfChildren,
      String profession,
      String income,
      String livingSituation,
      String willingToRelocate,
      String relationshipYouAreLookingFor,
      String nationality,
      String education,
      String language,
      String religion,
      String ethnicity) async {
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
    await uploadImage();
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserId)
        .update({
      "name": name,
      "phoneNumber": phoneNumber,
      "age": int.parse(age),
      "city": city,
      "country": country,
      "lookingForInAPartner": lookingForInAPartner,
      "profileHeading": profileHeading,
      "publishedDateTime": DateTime.now(),
      "height": height,
      "weight": weight,
      "bodyType": bodyType,
      "drink": drink,
      "smoke": smoke,
      "maritalStatus": maritalStatus,
      "haveChildren": haveChildren,
      "numberOfChildren": numberOfChildren,
      "profession": profession,
      "income": income,
      "livingSituation": livingSituation,
      "willingToRelocate": willingToRelocate,
      "relationshipYouAreLookingFor": relationshipYouAreLookingFor,
      "nationality": nationality,
      "education": education,
      "language": language,
      "religion": religion,
      "ethnicity": ethnicity,
      //Images
      'urlImage1': urlList[0].toString(),
      'urlImage2': urlList[1].toString(),
      'urlImage3': urlList[2].toString(),
      'urlImage4': urlList[3].toString(),
      'urlImage5': urlList[4].toString(),
    });
    Get.snackbar(
        'Update Successful', "Your account has been updated successfully");
    Get.to(HomeScreen());
    setState(() {
      uploading = false;
      _image.clear();
      urlList.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveUserData();
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
                    if (_image.length == 5) {
                      setState(() {
                        uploading = true;
                        next = true;
                      });
                    } else {
                      Get.snackbar(
                          "5 images", "only upto 5 images can be selected");
                    }
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return const Center(
                    //           child: Column(
                    //         children: [
                    //           CircularProgressIndicator(),
                    //           SizedBox(
                    //             height: 10,
                    //           ),
                    //           Text("Uploading Images....")
                    //         ],
                    //       ));
                    //     });
                    uploadImage();
                  },
                  icon: const Icon(
                    Icons.navigate_next_outlined,
                    size: 36,
                  ))
        ],
      ),
      body: next
          ?
          //we add this code to allow user to edit the previous information
          SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "PERSONAL INFO",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    //personal info

                    const SizedBox(
                      height: 30,
                    ),
                    //personal info
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.age,
                        labelText: 'age',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //personal info
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.email,
                        labelText: 'email',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //personal info
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.phoneNumber,
                        labelText: 'PhoneNumber',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //personal info
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.city,
                        labelText: 'city',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //personal info
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.country,
                        labelText: 'Country',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //personal info
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.password,
                        labelText: 'PassWord',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //personal info
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.lookingForInAPartner,
                        labelText: 'looking for in a partner',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.ProfileHeading,
                        labelText: 'Profile Heading',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    //Appearance
                    const Text(
                      "APPEARANCE",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.height,
                        labelText: 'Height',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.weight,
                        labelText: 'Weight',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.bodyType,
                        labelText: 'Body Type',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    const Text(
                      "LIFE STYLE",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.drink,
                        labelText: 'Drink',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.smoke,
                        labelText: 'smoke',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.maritalStatus,
                        labelText: 'marital status',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.haveChildren,
                        labelText: 'have children',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.numberOfChildren,
                        labelText: 'number of children',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.profession,
                        labelText: 'Profession',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.income,
                        labelText: 'Income',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.livingSituation,
                        labelText: 'living situation',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.willingToRelocate,
                        labelText: 'willing to relocate',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController:
                            usercontrollers.relationshipYouAreLookingFor,
                        labelText: 'relationship you are looking for',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    const Text(
                      "CULTURAL",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.nationality,
                        labelText: 'Nationality',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.education,
                        labelText: 'Education',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.language,
                        labelText: 'language',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.religion,
                        labelText: 'religion',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                        // assetRef: "assets/images/logo.jpeg",
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.ethnicity,
                        labelText: 'ethnicity',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      child: CustomTextFieldWidget(
                        editingController: usercontrollers.ethnicity,
                        labelText: 'ethnicity',
                        isHidden: false,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //login button
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 36,
                      decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: InkWell(
                        onTap: () async {
                          if (usercontrollers.name.text.trim().isNotEmpty) {
                            _image.length > 0
                                ? await updateUserDataToFireStoreDatabase(
                                    usercontrollers.name.text.trim(),
                                    usercontrollers.phoneNumber.text.trim(),
                                    usercontrollers.age.text.trim(),
                                    usercontrollers.city.text.trim(),
                                    usercontrollers.country.text.trim(),
                                    usercontrollers.lookingForInAPartner.text
                                        .trim(),
                                    usercontrollers.ProfileHeading.text.trim(),
                                    // DateTime.now(),
                                    usercontrollers.height.text.trim(),
                                    usercontrollers.weight.text.trim(),
                                    usercontrollers.bodyType.text.trim(),
                                    usercontrollers.drink.text.trim(),
                                    usercontrollers.smoke.text.trim(),
                                    usercontrollers.maritalStatus.text.trim(),
                                    usercontrollers.haveChildren.text.trim(),
                                    usercontrollers.numberOfChildren.text
                                        .trim(),
                                    usercontrollers.profession.text.trim(),
                                    usercontrollers.income.text.trim(),
                                    usercontrollers.livingSituation.text.trim(),
                                    usercontrollers.willingToRelocate.text
                                        .trim(),
                                    usercontrollers
                                        .relationshipYouAreLookingFor.text
                                        .trim(),
                                    usercontrollers.nationality.text.trim(),
                                    usercontrollers.education.text.trim(),
                                    usercontrollers.language.text.trim(),
                                    usercontrollers.religion.text.trim(),
                                    usercontrollers.ethnicity.text.trim())
                                : null;
                          } else {
                            Get.snackbar("A field is Missing",
                                "Please enter the field again");
                          }
                        },
                        child: const Center(
                          child: Text(
                            "Update Account",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
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
                                      // means images cannot be more than 5
                                      if (_image.length < 5) {
                                        !uploading ? chooseImage() : null;
                                      } else {
                                        setState(() {
                                          uploading = true;
                                        });
                                        Get.snackbar("all images full",
                                            "all 5 images are  selected");
                                      }
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
