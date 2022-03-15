import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preference/models/note_model.dart';
import 'package:shared_preference/pages/login_page.dart';
import 'package:shared_preference/services/prefs.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
static final String id="home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _storeInfo() async{
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    int? phone = int.tryParse(phoneController.text);
    var user = User.from(email: email, password: password, phone: phone);
    Prefs.storeUser(user);
  }

  void _loadInfo() async{
    var user = await Prefs.loadUser();
    print(user!.toJson().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15,right: 15),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.shade200
              ),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: InputBorder.none,
                    icon: Icon(CupertinoIcons.mail_solid,color: Colors.blue,)
                ),
              ),
            ),
            const SizedBox(
              height: 15,),
            Container(
              padding: const EdgeInsets.only(left: 15,right: 15),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.shade200
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: const InputDecoration(
                    hintText: "phone",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: InputBorder.none,
                    icon: Icon(CupertinoIcons.phone_fill,color: Colors.blue,)
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15,right: 15),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.shade200,
              ),
              child: TextField(
                obscuringCharacter: '*',
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    icon: Icon(Icons.lock,color: Colors.blue,)
                ),
              ),
            ),
            const SizedBox(
              height: 15,),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: TextButton(
                onPressed: (){
                  _storeInfo();
                },child: const Text("Store",style: TextStyle(color: Colors.white),),),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: TextButton(
                onPressed: (){
                  _loadInfo();
                },child: const Text("Load",style: TextStyle(color: Colors.white),),),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: TextButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, LogInPage.id);
                },child: const Text("LogInPage",style: TextStyle(color: Colors.white),),),
            ),
          ],
        ),
      ),
    );
  }
}
