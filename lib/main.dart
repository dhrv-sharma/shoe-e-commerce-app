import 'package:ecommerce/controllers/cart_notifer.dart';
import 'package:ecommerce/controllers/mainscreen_providers.dart';
import 'package:ecommerce/controllers/password_notify.dart';
import 'package:ecommerce/controllers/product_providers.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/home.dart';
import 'package:ecommerce/loginpage.dart';
import 'package:ecommerce/sign_re.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.grey.shade300, // navigation bar color
  ));

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    // Multiproviders
    providers: [
      ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
      ChangeNotifierProvider(create: (context) => ProductNotifiers()),
      ChangeNotifierProvider(create: (context) => cart_Notifer()),
      ChangeNotifierProvider(create: (context) => Login_notify())
    ], // we are using multiproviders hence have to mention all providers
    child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: FirebaseAuth.instance.currentUser == null
                  ? loginPage()
                  : home());
        }),
  ));
}
