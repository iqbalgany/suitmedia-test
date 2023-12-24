// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_project/models/user_model.dart';
import 'package:suitmedia_test_project/view_models/palindrome_view_model.dart';
import 'package:suitmedia_test_project/view_models/user_view_model.dart';
import 'package:suitmedia_test_project/views/screens/second_screen.dart';

class UserCard extends StatefulWidget {
  final UserModel user;
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    final palindromeViewModel =
        Provider.of<PalindromeViewModel>(context, listen: false);
    return Consumer<UserViewModel>(
      builder: (context, state, _) {
        return GestureDetector(
          onTap: () {
            state.user = widget.user;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(
                  name: palindromeViewModel.nameController.text,
                ),
              ),
            );
          },
          child: SizedBox(
            width: 335,
            height: 80,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.user.avatar),
                      ),
                      shape: BoxShape.circle),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.user.firstName} ${widget.user.lastName}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      widget.user.email,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    // ListTile(
    //   leading: CircleAvatar(
    //     child: Image.network(
    //       widget.user.avatar,
    //     ),
    //   ),
    //   title: Text('${widget.user.firstName} ${widget.user.lastName}'),
    //   titleTextStyle: TextStyle(
    //     fontWeight: FontWeight.w500,
    //     fontSize: 16,
    //     color: Colors.black,
    //   ),
    //   subtitle: Text(widget.user.email),
    //   subtitleTextStyle: TextStyle(
    //     fontWeight: FontWeight.w500,
    //     fontSize: 10,
    //     color: Colors.black,
    //   ),
    // );
  }
}
