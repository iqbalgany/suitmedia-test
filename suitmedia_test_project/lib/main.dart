import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_project/view_models/palindrome_view_model.dart';
import 'package:suitmedia_test_project/view_models/user_view_model.dart';
import 'package:suitmedia_test_project/views/screens/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PalindromeViewModel(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          home: const FirstScreen(),
        );
      },
    );
  }
}
