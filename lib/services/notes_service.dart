import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:memorie_note_taking_app/global_providers_container.dart';
import 'package:memorie_note_taking_app/models/folder_model.dart';
import 'package:memorie_note_taking_app/models/notes_model.dart';

class NotesService {
  final Ref container;

  List<NotesModel> _allNotes = [];
  List<NotesModel> _notesInFolder = [];

  NotesModel _notes = NotesModel(0, "", "");

  NotesService(this.container);

  void getAllNotes(List<FolderModel> folders) {
    for (var folder in folders) {
      for (var note in folder.notes) {
        _allNotes.add(note);
      }
    }
  }

  void getNotesInFolder(List<NotesModel> notes) {
    _notesInFolder = notes;
  }

  void getNotes(int id) {
    for (var note in _allNotes) {
      if (note.id == id) {
        _notes = note;
        break;
      }
    }
  }

  List<NotesModel> get notes => _allNotes;
  List<NotesModel> get notesInFolder => _notesInFolder;
  NotesModel get currentNote => _notes;
}
