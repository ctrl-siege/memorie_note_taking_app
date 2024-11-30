import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:memorie_note_taking_app/global_providers_container.dart';
import 'package:memorie_note_taking_app/models/flashcard_model.dart';
import 'package:memorie_note_taking_app/models/notes_model.dart';
import 'package:memorie_note_taking_app/models/qna_model.dart';

class FlashcardService {
  final Ref container;

  List<FlashcardModel> _flashcards = [
    FlashcardModel(1, 1, "Japanese Hiragana",
        [QnaModel(1, "su", "す"), QnaModel(2, "shi", "し")]),
    FlashcardModel(2, 2, "Data Structures", [
      QnaModel(3, "Stack", "す"),
      QnaModel(4, "Queue", "し"),
      QnaModel(5, "Array", "し"),
    ]),
  ];

  List<FlashcardModel> _current_flashcard = [];

  FlashcardService(this.container);

  List<FlashcardModel> get flashcards => _flashcards;
}
