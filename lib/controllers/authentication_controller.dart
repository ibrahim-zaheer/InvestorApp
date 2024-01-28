import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthenticatorController extends GetxController {
  static AuthenticatorController authenticatorController = Get.find();
  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  // to make the selected image apppear as profile define ImageFile like this instead of using final
  XFile? ImageFIle;
  pickImageFileFromGallery() async {
    // final ImageFIle = await ImagePicker().pickImage(source: ImageSource.gallery); then go on registration_screen.dart and make icon button async that is use to select image or use camera
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
}
