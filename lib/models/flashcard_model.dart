import 'package:memorie_note_taking_app/models/qna_model.dart';

class FlashcardModel {
  int id;
  int notes;
  String notesName;
  List<QnaModel> qna = [];

  FlashcardModel(this.id, this.notes, this.notesName, this.qna);
}
