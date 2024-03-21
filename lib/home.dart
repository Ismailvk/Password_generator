import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class PasswordGeneratorScreen extends StatefulWidget {
  const PasswordGeneratorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordGeneratorScreenState createState() =>
      _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  bool useUppercase = false;
  bool useSymbols = false;
  int passwordLength = 8;
  late String generatedPassword = ''; // Initialize with an empty string

  void generatePassword() {
    setState(() {
      generatedPassword = PasswordGenerator.generatePassword(
          passwordLength, useUppercase, useSymbols);
    });
  }

  void copyToClipboard() {
    FlutterClipboard.copy(generatedPassword).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password copied to clipboard'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    generatedPassword.isNotEmpty
                        ? generatedPassword
                        : 'Your Password',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed:
                        generatedPassword.isNotEmpty ? copyToClipboard : null,
                    child: const Text('Copy to Clipboard'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Password Length: $passwordLength'),
            Slider(
              value: passwordLength.toDouble(),
              min: 4,
              max: 20,
              onChanged: (value) {
                setState(() {
                  passwordLength = value.toInt();
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Include Uppercase Letters'),
                Switch(
                  value: useUppercase,
                  onChanged: (value) {
                    setState(() {
                      useUppercase = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Include Symbols'),
                Switch(
                  value: useSymbols,
                  onChanged: (value) {
                    setState(() {
                      useSymbols = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generatePassword,
              child: const Text('Generate Password'),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordGenerator {
  static String generatePassword(
      int length, bool useUppercase, bool useSymbols) {
    final random = Random();
    const lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    const uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const symbols = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

    String chars = lowercaseLetters;
    if (useSymbols) chars += symbols;
    if (useUppercase) chars += uppercaseLetters;

    // Ensure the password length is at least the specified length
    length = length.clamp(4, chars.length);

    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}
