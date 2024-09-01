import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:origin_vault/core/common/common_pages/homepage.dart';
import 'package:origin_vault/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // ensureScreenSize: true,
      designSize: const Size(393, 844),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home page',
        theme: Apptheme.themeMode,
        home: const HomePage(),
      ),
    );
  }
}
