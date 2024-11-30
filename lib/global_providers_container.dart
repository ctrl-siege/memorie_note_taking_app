import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memorie_note_taking_app/services/flashcard_services.dart';
import 'package:memorie_note_taking_app/services/folder_services.dart';
import 'package:memorie_note_taking_app/services/navigation_service.dart';
import 'package:memorie_note_taking_app/services/notes_service.dart';
import 'package:memorie_note_taking_app/services/user_service.dart';

final navigationServiceProvider = Provider((ref) => NavigationService(ref));
final userServiceProvider = Provider((ref) => UserService(ref));
final folderServiceProvider = Provider((ref) => FolderService(ref));
final notesServiceProvider = Provider((ref) => NotesService(ref));
final flashcardServiceProvider = Provider((ref) => FlashcardService(ref));
