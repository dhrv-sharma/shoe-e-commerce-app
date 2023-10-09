import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controllers/mainscreen_providers.dart';
import 'package:ecommerce/controllers/product_providers.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void signin() async {
  // login
  await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "test@gmail.com", password: "test123456");
  if (FirebaseAuth.instance.currentUser != null) {
    print("signed In");
  } else {
    print("not ");
  }

  // add data
  // await FirebaseFirestore.instance
  //     .collection('users')
  //     .doc("test@gmail.com")
  //     .collection("shoes")
  //     .doc("3")
  //     .set({
  //   'cart': 'false',
  //   'fav': 'true',
  //   'id': '3',
  //   'quantity': '3',
  //   'gend': 'male',
  //   'size': [0, 0, 0]
  // });

  // await FirebaseFirestore.instance
  //     .collection('users')
  //     .doc("dhruvsharma@gmail.com")
  //     .collection("shoes")
  //     .get()
  //     .then((value) {
  //   value.docs.forEach((element) {
  //     Map shoe = element.data();
  //     print(shoe["id"]);
  //   });
  // });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  signin();

  runApp(MultiProvider(
    // Multiproviders
    providers: [
      ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
      ChangeNotifierProvider(create: (context) => ProductNotifiers()),
    ], // we are using multiproviders hence have to mention all providers
    child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: home(),
          );
        }),
  ));
}
