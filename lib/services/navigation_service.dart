// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:memorie_note_taking_app/screens/home_screen.dart';
import 'package:memorie_note_taking_app/screens/folders_screen.dart';
import 'package:memorie_note_taking_app/screens/flashcards_screen.dart';
import 'package:memorie_note_taking_app/screens/profile_screen.dart';

class NavigationService {
  final Ref container;

  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    FoldersScreen(),
    FlashcardsScreen(),
    ProfileScreen()
  ];

  NavigationService(this.container);

  int get currentIndex => _currentIndex;

  void changeIndex({required int index}) {
    _currentIndex = index;
    container.notifyListeners();
  }

  Widget getCurrentPage() {
    return _screens[_currentIndex];
  }
}
