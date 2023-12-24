// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_project/view_models/palindrome_view_model.dart';
import 'package:suitmedia_test_project/view_models/user_view_model.dart';
import 'package:suitmedia_test_project/views/screens/second_screen.dart';
import 'package:suitmedia_test_project/views/widgets/user_card.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    userViewModel.userFuture ??= userViewModel.getUserData();
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
          'Third Screen',
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
                builder: (context) => SecondScreen(
                  name: palindromeViewModel.nameController.text,
                ),
              ),
            );
          },
        ),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, state, _) {
          return Builder(
            builder: (context) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.users.isNotEmpty) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    return UserCard(user: state.users[index]);
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}
