import 'dart:io';

import 'package:flutter/material.dart';
import 'package:investorapp/controllers/authentication_controller.dart';
import '../components/text_Editing_controllers.dart';
import 'package:investorapp/widget/custom_text_field_widget.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showProgressBar = false;
  var authController = AuthenticatorController.authenticatorController;
  // //personal info
  // TextEditingController _emailTextEditingController = TextEditingController();

  // TextEditingController _passwordTextEditingController =
  //     TextEditingController();
  // TextEditingController _nameTextEditingController = TextEditingController();

  // TextEditingController _phoneNumberTextEditingController =
  //     TextEditingController();
  // TextEditingController _ageTextEditingController = TextEditingController();

  // TextEditingController _cityTextEditingController = TextEditingController();
  // TextEditingController _countryTextEditingController = TextEditingController();

  // TextEditingController _lookingforInAPartnerTextEditingController =
  //     TextEditingController();

  // //Appearance

  // TextEditingController _heightTextEditingController = TextEditingController();
  // TextEditingController _weightTextEditingController = TextEditingController();

  // TextEditingController _bodytypeTextEditingController =
  //     TextEditingController();

  // //LifeStyle
  // TextEditingController _drinkTextEditingController = TextEditingController();

  // TextEditingController _smokeTextEditingController = TextEditingController();

  // TextEditingController _martialstatusTextEditingController =
  //     TextEditingController();
  // TextEditingController _haveChildrenTextEditingController =
  //     TextEditingController();

  // TextEditingController _numberOfChildrenTextEditingController =
  //     TextEditingController();
  // TextEditingController _ProfessionTextEditingController =
  //     TextEditingController();

  // TextEditingController _IncomeTextEditingController = TextEditingController();
  // TextEditingController _livingSituationTextEditingController =
  //     TextEditingController();

  // TextEditingController _willingtoRelocateTextEditingController =
  //     TextEditingController();
  // TextEditingController _relationshipYouAreLookingForTextEditingController =
  //     TextEditingController();

  // //Cultural Choices
  // TextEditingController _NationalityTextEditingController =
  //     TextEditingController();

  // TextEditingController _educationTextEditingController =
  //     TextEditingController();
  // TextEditingController _languageTextEditingController =
  //     TextEditingController();

  // TextEditingController _religionTextEditingController =
  //     TextEditingController();
  // TextEditingController _ethnicityTextEditingController =
  //     TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingControllers usercontrollers = TextEditingControllers();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            const Text(
              "create Account",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "To get started now",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            //Choose Image for profile
            authController.ImageFIle == null
                ? const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/logo.jpeg"),
                    backgroundColor: Colors.black,
                  )
                : Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: FileImage(File(
                            authController.ImageFIle!.path,
                          ))),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      await authController.pickImageFileFromGallery();
                      setState(() {
                        authController.ImageFIle;
                      });
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                    )),
                const SizedBox(
                  height: 30,
                ),
                IconButton(
                    onPressed: () async {
                      await authController.captureImageFileFromCamera();
                      setState(() {
                        authController.ImageFIle;
                      });
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                    ))
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            const Text(
              "PERSONAL INFO",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            //personal info
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.name,
                labelText: 'name',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //personal info
            Container(
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
            Container(
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
            Container(
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
            Container(
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
            Container(
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
            Container(
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
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.lookingForInAPartner,
                labelText: 'looking for in a partner',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
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
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.height,
                labelText: 'Height',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.weight,
                labelText: 'Weight',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
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
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.drink,
                labelText: 'Drink',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.smoke,
                labelText: 'smoke',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.maritalStatus,
                labelText: 'marital status',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.haveChildren,
                labelText: 'have children',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.numberOfChildren,
                labelText: 'number of children',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.profession,
                labelText: 'Profession',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.income,
                labelText: 'Income',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.livingSituation,
                labelText: 'living situation',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.willingToRelocate,
                labelText: 'willing to relocate',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.relationshipYouAreLookingFor,
                labelText: 'relationship you are looking for',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            const Text(
              "CULTURAL",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.nationality,
                labelText: 'Nationality',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.education,
                labelText: 'Education',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFieldWidget(
                editingController: usercontrollers.language,
                labelText: 'language',
                isHidden: false,
                iconData: Icons.email_outlined,
              ),
            ),
            Container(
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
                  if (authController.ImageFIle != null) {
                    if (usercontrollers.name.text.trim().isNotEmpty &&
                        usercontrollers.email.text.trim().isNotEmpty &&
                        usercontrollers.password.text.trim().isNotEmpty) {
                      setState(() {
                        showProgressBar = true;
                      });
                      await authController.createNewUserAccount(
                          usercontrollers.email.text.trim(),
                          authController.profileImage!,
                          usercontrollers.name.text.trim(),
                          usercontrollers.phoneNumber.text.trim(),
                          usercontrollers.password.text.trim(),
                          usercontrollers.age.text.trim(),
                          usercontrollers.city.text.trim(),
                          usercontrollers.country.text.trim(),
                          usercontrollers.lookingForInAPartner.text.trim(),
                          usercontrollers.ProfileHeading.text.trim(),
                          // DateTime.now(),
                          usercontrollers.height.text.trim(),
                          usercontrollers.weight.text.trim(),
                          usercontrollers.bodyType.text.trim(),
                          usercontrollers.drink.text.trim(),
                          usercontrollers.smoke.text.trim(),
                          usercontrollers.maritalStatus.text.trim(),
                          usercontrollers.haveChildren.text.trim(),
                          usercontrollers.numberOfChildren.text.trim(),
                          usercontrollers.profession.text.trim(),
                          usercontrollers.income.text.trim(),
                          usercontrollers.livingSituation.text.trim(),
                          usercontrollers.willingToRelocate.text.trim(),
                          usercontrollers.relationshipYouAreLookingFor.text
                              .trim(),
                          usercontrollers.nationality.text.trim(),
                          usercontrollers.education.text.trim(),
                          usercontrollers.language.text.trim(),
                          usercontrollers.religion.text.trim(),
                          usercontrollers.ethnicity.text.trim());

                      setState(() {
                        showProgressBar = false;
                      });
                    } else {
                      Get.snackbar(
                          "A field is Missing", "Please enter the field again");
                    }
                  } else {
                    Get.snackbar(
                        "Image is Missing", "Please select the image again");
                  }
                },
                child: const Center(
                  child: Text(
                    "Create an Account",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 36,
                  decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: InkWell(
                    onTap: () {
                      //for going to previos screen
                      Get.back();
                    },
                    child: const Center(
                      child: Text(
                        'Click Here',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      ),
                    ),
                  ),
                )
              ],
            ),
            showProgressBar == true
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
