import 'package:ecommerce/controllers/mainscreen_providers.dart';
import 'package:ecommerce/controllers/product_providers.dart';
import 'package:ecommerce/home.dart';
import 'package:ecommerce/productBYcat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    // Multiproviders
    providers: [
      ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
      ChangeNotifierProvider(create: (context) => ProductNotifiers())
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
