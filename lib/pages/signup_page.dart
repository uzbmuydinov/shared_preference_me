import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preference/models/note_model.dart';
import 'package:shared_preference/pages/login_page.dart';
import 'package:shared_preference/services/prefs.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const String id = "sign_up_page";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void _storeInfo2() async{
    String email = emailController.text.toString().trim();
    String name = nameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    int? phone = int.tryParse(phoneController.text);
    var accunt = Accaunt.from(email: email,name: name, password: password, phone: phone,);
    Prefs.storeAccaunt(accunt);

  }
  void _loadInfo() async{
    var accaunt = await Prefs.loadAccaunt();
    print(accaunt!.toJson().toString());
  }

  bool showIndicator = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, LogInPage.id);
            },
            icon: const Icon(
              CupertinoIcons.arrow_left,
              color: Colors.black87,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: showIndicator ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Let's get Started !",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Create an accaunt to Q Allure to get all features",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 45,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                controller: nameController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Name",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      CupertinoIcons.person_alt_circle,
                      size: 25,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                controller: emailController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Email",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      CupertinoIcons.mail_solid,
                      size: 25,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                controller: phoneController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Phone",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      size: 25,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                controller: passwordController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.lock_open,
                      size: 25,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textAlignVertical: TextAlignVertical.center,
                controller: passwordController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Confirm Password",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      CupertinoIcons.lock_open,
                      size: 25,
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(35)),
                child: TextButton(
                  onPressed: () async {
                    setState(() {
                      showIndicator = true;
                    });
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.pushReplacementNamed(context, LogInPage.id);
                  },
                  child: const Text(
                    "CREATE",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an accaunt ? ",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _storeInfo2();
                      });
                    },
                    child: const Text(
                      "Login here",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  TextButton(
                    onPressed: ()  {
                      setState(() {
                        _loadInfo();
                      });
                    },
                    child: const Text(
                      "load",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}