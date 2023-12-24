// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_project/view_models/palindrome_view_model.dart';
import 'package:suitmedia_test_project/view_models/user_view_model.dart';
import 'package:suitmedia_test_project/views/screens/first_screen.dart';
import 'package:suitmedia_test_project/views/screens/third_screen.dart';
import 'package:suitmedia_test_project/views/widgets/custom_button.dart';

class SecondScreen extends StatefulWidget {
  final String name;
  const SecondScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    userViewModel.getUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final palindromeViewModel =
        Provider.of<PalindromeViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Second Screen',
        ),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FirstScreen(),
              ),
            );
          },
        ),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, state, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Welcome',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        )),
                    Text(
                      palindromeViewModel.nameController.text,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Builder(
                  builder: (context) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.user != null) {
                      return Center(
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(state.user!.avatar))),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              '${state.user!.firstName} ${state.user!.lastName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'Selected User Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                      );
                    }
                  },
                ),
                CustomButton(
                  text: 'Choose a User',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThirdScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
