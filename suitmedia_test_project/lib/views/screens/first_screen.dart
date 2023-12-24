import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_project/view_models/palindrome_view_model.dart';
import 'package:suitmedia_test_project/views/screens/second_screen.dart';
import 'package:suitmedia_test_project/views/widgets/custom_button.dart';
import 'package:suitmedia_test_project/views/widgets/custom_text_form_field.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final palindromeViewModel =
        Provider.of<PalindromeViewModel>(context, listen: false);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            fit: BoxFit.cover,
            'assets/images/background.png',
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 116,
                height: 116,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/icon_photo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 58,
              ),
              Form(
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: palindromeViewModel.nameController,
                      hintText: 'Name',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      hintText: 'Palindrome',
                      controller: palindromeViewModel.palindromeController,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              CustomButton(
                text: 'CHECK',
                onPressed: () {
                  palindromeViewModel.palindromeCheck();
                  palindromeViewModel.showResultDialog(
                      palindromeViewModel.result, context);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                text: 'NEXT',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        name: palindromeViewModel.nameController.text,
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
