import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_theme.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/routes/app_routes_file.dart';
import 'package:tinnierenee12/utils/app_size.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppSize.size = MediaQuery.of(context).size;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // initialRoute: AppRoutes.instance.initial,
      initialRoute: AppRoutes.instance.clientBusinessInfoScreen ,
      getPages: appRootRoutesFile,
      enableLog: true,
      defaultTransition: Transition.native,
      transitionDuration: Duration(milliseconds: 300),
      themeMode: ThemeMode.light,
      // initialBinding: AppBinding(),
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
    );
  }
}
