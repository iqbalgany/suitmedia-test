import 'package:flutter/material.dart';

class PalindromeViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();
  String result = '';

  void palindromeCheck() {
    result = isPalindrome(palindromeController.text)
        ? 'isPalindrome'
        : 'not palindrome';
    notifyListeners();
  }

  bool isPalindrome(String text) {
    String cleanText =
        text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    String reversedText = cleanText.split('').reversed.join('');
    return cleanText == reversedText;
  }

  void showResultDialog(String result, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Result'),
          content: Text(result,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
              textAlign: TextAlign.center),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
