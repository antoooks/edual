import 'package:edual/provider/AccountProvider.dart';
import 'package:edual/provider/AuthProvider.dart';
import 'package:edual/provider/CourseProvider.dart';
import 'package:edual/provider/LessonProvider.dart';
import 'package:edual/provider/TaskProvider.dart';
import 'package:edual/provider/WalletProvider.dart';
import 'package:edual/service/AccountService.dart';
import 'package:edual/service/CourseService.dart';
import 'package:edual/service/FirebaseStorageService.dart';
import 'package:edual/service/LessonService.dart';
import 'package:edual/service/TaskService.dart';
import 'package:edual/service/WalletService.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => AccountService());
  locator.registerLazySingleton(() => CourseService());
  locator.registerLazySingleton(() => LessonService());
  locator.registerLazySingleton(() => WalletService());
  locator.registerLazySingleton(() => TaskService());
  locator.registerLazySingleton(() => AccountProvider());
  locator.registerLazySingleton(() => CourseProvider());
  locator.registerLazySingleton(() => LessonProvider());
  locator.registerLazySingleton(() => WalletProvider());
  locator.registerLazySingleton(() => TaskProvider());
  locator.registerLazySingleton(() => AuthProvider());
  locator.registerLazySingleton(() => FirebaseStorageService());
}