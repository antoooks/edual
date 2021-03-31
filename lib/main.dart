import 'package:edual/provider/AccountProvider.dart';
import 'package:edual/provider/AuthProvider.dart';
import 'package:edual/provider/CourseProvider.dart';
import 'package:edual/provider/TaskProvider.dart';
import 'package:edual/provider/WalletProvider.dart';
import 'package:edual/service/LessonService.dart';
import 'package:edual/view/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>locator<AccountProvider>()),
        ChangeNotifierProvider(create: (_)=>locator<CourseProvider>()),
        ChangeNotifierProvider(create: (_)=>locator<AuthProvider>()),
        ChangeNotifierProvider(create: (_)=>locator<LessonService>()),
        ChangeNotifierProvider(create: (_)=>locator<WalletProvider>()),
        ChangeNotifierProvider(create: (_)=>locator<TaskProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'Edual',
        theme: ThemeData(
          primaryColor: Colors.cyan,
          accentColor: Colors.deepPurple,
        ),
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}