// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:memorie_note_taking_app/global_providers_container.dart';
import 'package:memorie_note_taking_app/screens/create_notes_screen.dart';
import 'package:memorie_note_taking_app/screens/login.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationServices = ref.watch(navigationServiceProvider);
    final userService = ref.watch(userServiceProvider);

    return Scaffold(
        extendBody: true,
        body:
            SafeArea(bottom: false, child: navigationServices.getCurrentPage()),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 22, 102, 97),
          foregroundColor: Colors.white,
          shape: CircleBorder(),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateNotesScreen()));
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Color(0xff152325),
          height: 72,
          shape: CircularNotchedRectangle(),
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          notchMargin: 8,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  navigationServices.changeIndex(index: 0);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.folder,
                  color: Colors.white,
                ),
                onPressed: () {
                  navigationServices.changeIndex(index: 1);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.quiz,
                  color: Colors.white,
                ),
                onPressed: () {
                  navigationServices.changeIndex(index: 2);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () {
                  userService.logOutUser();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ));
  }
}
