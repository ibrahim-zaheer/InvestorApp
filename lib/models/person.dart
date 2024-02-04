import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:investorapp/models/rough.dart';

class Person {
  String? uid;
  String? email;
  String? imageProfile;
  String? name;
  String? phoneNumber;
  String? password;
  int? age;
  String? city;
  String? country;
  String? lookingForInAPartner;
  String? profileHeading;
  int? publishedDateTime;

// Appearance
  String? height;
  String? weight;
  String? bodyType;

// LifeStyle
  String? drink;
  String? smoke;
  String? maritalStatus;
  String? haveChildren;
  String? numberOfChildren;
  String? profession;
  String? income;
  String? livingSituation;
  String? willingToRelocate;
  String? relationshipYouAreLookingFor;

// Cultural Choices
  String? nationality;
  String? education;
  String? language;
  String? religion;
  String? ethnicity;

  Person({
    this.uid,
    this.email,
    this.imageProfile,
    this.name,
    this.phoneNumber,
    this.password,
    this.age,
    this.city,
    this.country,
    this.lookingForInAPartner,
    this.profileHeading,
    this.publishedDateTime,

    // Appearance
    this.height,
    this.weight,
    this.bodyType,

    // LifeStyle
    this.drink,
    this.smoke,
    this.maritalStatus,
    this.haveChildren,
    this.numberOfChildren,
    this.profession,
    this.income,
    this.livingSituation,
    this.willingToRelocate,
    this.relationshipYouAreLookingFor,

    // Cultural Choices
    this.nationality,
    this.education,
    this.language,
    this.religion,
    this.ethnicity,
  });

  static Person fromdataSnapshot(DocumentSnapshot snapshot) {
    //when we recieve data from firestore, we store it in this form
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;
    return Person(
      uid: dataSnapshot['uid'],
      name: dataSnapshot['name'],
      imageProfile: dataSnapshot['imageProfile'],
      email: dataSnapshot['email'],
      phoneNumber: dataSnapshot['phoneNumber'],
      password: dataSnapshot['password'],
      age: dataSnapshot['age'],
      city: dataSnapshot['city'],
      country: dataSnapshot['country'],
      lookingForInAPartner: dataSnapshot['lookingForInAPartner'],
      profileHeading: dataSnapshot['profileHeading'],
      publishedDateTime: dataSnapshot['publishedDateTime'],
//appearance
      height: dataSnapshot['height'],
      weight: dataSnapshot['weight'],
      bodyType: dataSnapshot['bodyType'],

// LifeStyle
      drink: dataSnapshot['drink'],
      smoke: dataSnapshot['smoke'],
      maritalStatus: dataSnapshot['maritalStatus'],
      haveChildren: dataSnapshot['haveChildren'],
      numberOfChildren: dataSnapshot['numberOfChildren'],
      profession: dataSnapshot['profession'],
      income: dataSnapshot['income'],
      livingSituation: dataSnapshot['livingSituation'],
      willingToRelocate: dataSnapshot['willingToRelocate'],
      relationshipYouAreLookingFor:
          dataSnapshot['relationshipYouAreLookingFor'],

      // Cultural Choices
      nationality: dataSnapshot['nationality'],
      education: dataSnapshot['education'],
      language: dataSnapshot['language'],
      religion: dataSnapshot['religion'],
      ethnicity: dataSnapshot['ethnicity'],
    );
  }

  Map<String, dynamic> toJson() => {
        // Personal Information
        'uid': uid,
        'name': name,
        'imageProfile': imageProfile,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'age': age,
        'city': city,
        'country': country,
        'lookingForInAPartner': lookingForInAPartner,
        'profileHeading': profileHeading,
        'publishedDateTime': publishedDateTime,

        // Appearance
        'height': height,
        'weight': weight,
        'bodyType': bodyType,

        // LifeStyle
        'drink': drink,
        'smoke': smoke,
        'maritalStatus': maritalStatus,
        'haveChildren': haveChildren,
        'numberOfChildren': numberOfChildren,
        'profession': profession,
        'income': income,
        'livingSituation': livingSituation,
        'willingToRelocate': willingToRelocate,
        'relationshipYouAreLookingFor': relationshipYouAreLookingFor,

        // Cultural Choices
        'nationality': nationality,
        'education': education,
        'language': language,
        'religion': religion,
        'ethnicity': ethnicity,
      };
}
