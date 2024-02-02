// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class AuthenticatorController extends GetxController {
//   static AuthenticatorController authenticatorController = Get.find();
//   late Rx<File?> pickedFile;
//   File? get profileImage => pickedFile.value;
//   // to make the selected image apppear as profile define ImageFile like this instead of using final
//   XFile? ImageFIle;
//   pickImageFileFromGallery() async {
//     // final ImageFIle = await ImagePicker().pickImage(source: ImageSource.gallery); then go on registration_screen.dart and make icon button async that is use to select image or use camera
//     ImageFIle = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (ImageFIle != null) {
//       Get.snackbar("Profile Image", "Image Successfully Added to the Screen");
//     }
//     pickedFile = Rx<File?>(File(ImageFIle!.path));
//   }

//   captureImageFileFromCamera() async {
//     ImageFIle = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (ImageFIle != null) {
//       Get.snackbar("Profile Image",
//           "Image Successfully Added to the Screen using camera");
//     }
//     pickedFile = Rx<File?>(File(ImageFIle!.path));
//   }
//   Future<String> uploadImageToStorage(File imageFile) async{
// //use this line when need to store image in the firestore and the folder name will be ImageProfile
//  Reference referenceStorage = FirebaseStorage.instance.ref().child('ImageProfile').child(FirebaseAuth.instance.currentUser!.uid);
//  //this line will upload file to the storage
//  UploadTask uploadTask = referenceStorage.putFile(imageFile);
//  // we use this line to get download url of the file that was uploaded
//  TaskSnapshot snapshot = await uploadTask;
//  String downloadUrlOfImage = await snapshot.ref.getDownloadURL();
//  return downloadUrlOfImage;

//   }

//   createNewUserAccount(
//       String email,
//       File imageProfile,
//       String name,
//       String phoneNumber,
//       String password,
//       String age,
//       String city,
//       String country,
//       String lookingForInAPartner,
//       String profileHeading,
//       int? publishedDateTime,
//       String height,
//       String weight,
//       String bodyType,
//       String drink,
//       String smoke,
//       String maritalStatus,
//       String haveChildren,
//       String numberOfChildren,
//       String profession,
//       String income,
//       String livingSituation,
//       String willingToRelocate,
//       String relationshipYouAreLookingFor,
//       String nationality,
//       String education,
//       String language,
//       String religion,
//       String ethnicity) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//     }
//     String downloadedUrlOfImage =  await uploadImageToStorage(imageProfile);
//     catch (errorMsg) {
//       Get.snackbar("Account Creation error", "Error Occured: $errorMsg");
//     }
//   }
// }
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investorapp/homseScreen/home_screen.dart';
import 'package:investorapp/models/person.dart' as personModel;

class AuthenticatorController extends GetxController {
  static AuthenticatorController authenticatorController = Get.find();
  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? ImageFIle;

  pickImageFileFromGallery() async {
    ImageFIle = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (ImageFIle != null) {
      Get.snackbar("Profile Image", "Image Successfully Added to the Screen");
    }
    pickedFile = Rx<File?>(File(ImageFIle!.path));
  }

  captureImageFileFromCamera() async {
    ImageFIle = await ImagePicker().pickImage(source: ImageSource.camera);
    if (ImageFIle != null) {
      Get.snackbar("Profile Image",
          "Image Successfully Added to the Screen using camera");
    }
    pickedFile = Rx<File?>(File(ImageFIle!.path));
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child('ImageProfile')
        .child(FirebaseAuth.instance.currentUser!.uid);
//  // we use this line to get download url of the file that was uploaded
    UploadTask uploadTask = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrlOfImage = await snapshot.ref.getDownloadURL();
    return downloadUrlOfImage;
  }

  createNewUserAccount(
      String email,
      File imageProfile,
      String name,
      String phoneNumber,
      String password,
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
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String downloadUrlOfImage = await uploadImageToStorage(imageProfile);
      // saving user info to firestore
      personModel.Person personInstance = personModel.Person(
          imageProfile: downloadUrlOfImage,
          email: email,
          name: name,
          phoneNumber: phoneNumber,
          password: password,
          // age: age,
          age: int.parse(age),
          city: city,
          country: country,
          lookingForInAPartner: lookingForInAPartner,
          profileHeading: profileHeading,
          publishedDateTime: DateTime.now().microsecondsSinceEpoch,
          height: height,
          weight: weight,
          bodyType: bodyType,
          drink: drink,
          smoke: smoke,
          maritalStatus: maritalStatus,
          haveChildren: haveChildren,
          numberOfChildren: numberOfChildren,
          profession: profession,
          income: income,
          livingSituation: livingSituation,
          willingToRelocate: willingToRelocate,
          relationshipYouAreLookingFor: relationshipYouAreLookingFor,
          nationality: nationality,
          education: education,
          language: language,
          religion: religion,
          ethnicity: ethnicity);
      //we create this so each users get its own unique uid
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(personInstance.toJson());

      Get.snackbar(
          "Account Created", "Congratulations Account created successfully");
      Get.to(HomeScreen());
      // Rest of your code for creating a new user goes here
    } catch (error) {
      Get.snackbar("Account Creation error", "Error Occurred: $error");
    }
  }
}
