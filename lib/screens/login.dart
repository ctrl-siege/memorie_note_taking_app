// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:memorie_note_taking_app/global_providers_container.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final userService = ref.watch(userServiceProvider);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: 800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon.png',
              height: 120,
              width: 120,
            ),
            Text(
              "Memorie.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Gap(48),
            Container(
              height: 48,
              width: 300,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Username"),
                ),
              ),
            ),
            Gap(16),
            Container(
              height: 48,
              width: 300,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Password"),
                ),
              ),
            ),
            Gap(32),
            OutlinedButton(
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
                  foregroundColor: WidgetStatePropertyAll(Color(0xfffffaff)),
                  backgroundColor: WidgetStatePropertyAll(Color(0xff152325)),
                  fixedSize: WidgetStatePropertyAll(Size(300, 48))),
              onPressed: () {
                String username = usernameController.text;
                String pass = passwordController.text;

                userService.logInUser(username, pass);

                if (userService.isLoggedIn) {
                  Navigator.pushNamed(context, '/main');
                }
              },
              child: Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
