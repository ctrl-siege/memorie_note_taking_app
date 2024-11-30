import 'package:memorie_note_taking_app/models/notes_model.dart';

class FolderModel {
  int id;
  String name;
  int owner;
  List<NotesModel> notes = [];

  FolderModel(this.id, this.name, this.owner, this.notes);
}
