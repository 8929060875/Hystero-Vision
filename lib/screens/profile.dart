import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hystero/models/profile_details.dart';
import 'package:hystero/services/firebase_services.dart';
import 'package:hystero/utils/menu_drawer.dart';
import 'package:hystero/utils/size_configs.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController affiliationController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController fieldStudyController = TextEditingController();

  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  fetchUser() async {
    var details = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> value) {
      nameController.text = value['name'];
      affiliationController.text = value['affiliation'];
      expController.text = value['experience in this field'];
      fieldStudyController.text = value['number of capsules read'];
    });
    mapUser(details);
  }

  mapUser(QuerySnapshot<Map<String, dynamic>> details) {
    var info = details.docs
        .map(
          (detail) => ProfileDetails(
            userEmail: detail.id,
            affiliation: detail["affiliation"],
            experienceInThisField: detail["experience in this field"],
            name: detail["name"],
            numberOfCapsulesRead: detail["number of capsules read"],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(255, 141, 199, 1),
        centerTitle: true,
        title: const Text('Profile'),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
            ),
          ),
        ),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              const Text('Name'),
              TextField(
                controller: nameController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  // hintText: 'Enter your name',
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(35),
              ),
              const Text('Affiliation'),
              TextField(
                controller: affiliationController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  //  hintText: 'Enter your name',
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(35),
              ),
              const Text('Experience in Hysteroscopy Reading'),
              TextField(
                controller: expController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  //  hintText: 'Enter your name',
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                  fillColor: Colors.black,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(35),
              ),
              const Text('Enter the number of Hysteroscopy Read till date'),
              TextField(
                controller: fieldStudyController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  // hintText: 'Enter your name',
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(15),
                ),
                child: GestureDetector(
                  onTap: () {
                    FirebaseServices().updateInfo(
                      name: nameController.text,
                      affiliation: affiliationController.text,
                      exp: expController.text,
                      fieldStudy: fieldStudyController.text,
                      context: context,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenHeight(20)),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 221, 210, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Update Information',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
