// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:memorie_note_taking_app/global_providers_container.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesService = ref.watch(notesServiceProvider);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Row(
                  children: [
                    Text(
                      notesService.currentNote.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.quiz))
                  ],
                )
              ]),
              Gap(8),
              Text(notesService.currentNote.notes),
            ],
          ),
        ),
      ),
    );
  }
}
