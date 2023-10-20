import 'package:ecommerce/controllers/password_notify.dart';
import 'package:ecommerce/home.dart';
import 'package:ecommerce/register.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:ecommerce/views/shared/customfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // instance of the notifer is created
    var authNotifer = Provider.of<Login_notify>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50.h,
        backgroundColor: Colors.black,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black, // Navigation bar
          statusBarColor: Colors.black, // Status bar
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: ListView(
          // conventional method to display children in column or row
          padding: EdgeInsets.zero,

          children: [
            Text(
              "Welcome!",
              style: appstyle(30, Colors.white, FontWeight.w600),
            ),
            Text(
              "Login in your account",
              style: appstyle(16, Colors.white, FontWeight.w900),
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomField(
              hintText: "Email",
              ts: TextInputAction.done,
              controller: email,
              validator: (email) {
                if (email!.isEmpty && !email.contains("@")) {
                  // checking the input user
                  return 'Please provide valid email';
                }
              },
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomField(
              keyboard: TextInputType.emailAddress,
              hintText: "Password",
              ts: TextInputAction.done,
              controller: pass,
              obscureText: authNotifer.issecured,
              suffixIcon: GestureDetector(
                onTap: () {
                  authNotifer.issecured = !authNotifer.issecured;
                },
                child: !authNotifer.issecured
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
              validator: (password) {
                if (password!.isEmpty && password.length < 7) {
                  // checking the input user
                  return 'Password too weak';
                }
              },
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => resgisterUser()));
                },
                child: Text(
                  "Register",
                  style: appstyle(16, Colors.white, FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text, password: pass.text);

                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => home()));
                },
                child: Container(
                  height: 55.h,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Center(
                    child: Text(
                      "L O G I N",
                      style: appstyle(18, Colors.black, FontWeight.bold),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
