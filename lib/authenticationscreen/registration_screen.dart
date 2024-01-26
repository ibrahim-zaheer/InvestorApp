import 'package:flutter/material.dart';
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
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/images/logo.jpeg"),
                backgroundColor: Colors.black,
              ),
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
                editingController: usercontrollers.phoneNumber,
                labelText: 'Phone Number',
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
                onTap: () {},
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
                        'Login Here',
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
