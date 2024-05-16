import 'package:flutter/material.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:untitled/screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/users_screen.dart';

import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';

import 'providers/auth_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
    create: (context) => AuthProvider(),
    child: MainApp(),
  ),
  );
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/register' : (context) => const RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/users': (context) => const UsersScreen(),
      },
    );
  }
}