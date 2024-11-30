// ignore_for_file: prefer_final_fields

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:memorie_note_taking_app/global_providers_container.dart';
import 'package:memorie_note_taking_app/models/folder_model.dart';
import 'package:memorie_note_taking_app/models/notes_model.dart';

class FolderService {
  final Ref container;

  List<FolderModel> _folders = [
    FolderModel(1, "Japanese Hiragana", 1, [
      NotesModel(1, "Hiragana Alphabet", "す >> su\nし >> shi"),
      NotesModel(2, "Hiragana Basic Words Pt 1", "すし >> sushi"),
    ]),
    FolderModel(2, "Data Structures", 1, [
      NotesModel(3, "Stack", "Stack >> "),
      NotesModel(4, "Queue", "Queue >> "),
      NotesModel(5, "Array", "Array >>"),
    ]),
  ];

  List<FolderModel> _ownerFolders = [];

  FolderService(this.container);

  void getFolders(int owner) {
    for (var folder in _folders) {
      if (folder.owner == owner) {
        _ownerFolders.add(folder);
      }
    }
  }

  void addNote(String name, String folder, String notes) {
    for (var folder in _folders) {
      if (folder.name == name) {
        folder.notes.add(NotesModel(6, name, notes));
        break;
      }
    }
  }

  List<FolderModel> get folders => _ownerFolders;
}
