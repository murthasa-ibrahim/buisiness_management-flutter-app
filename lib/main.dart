import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_relu/view/splash/splash_vew.dart';
import 'package:task_relu/view_model/invite_provider.dart';
import 'package:task_relu/view_model/navbar_provider.dart';
import 'package:task_relu/view_model/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavbarProvider>(create: (context) => NavbarProvider(),),
        ChangeNotifierProvider<InviteProvider>(create: (context) => InviteProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: MyThemes.lightThem,
        darkTheme: MyThemes.darkTheme,
        home:const Splash() ,
      ),
    );
  }
}



