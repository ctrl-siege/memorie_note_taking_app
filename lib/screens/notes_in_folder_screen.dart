import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:memorie_note_taking_app/global_providers_container.dart';
import 'package:memorie_note_taking_app/screens/notes_screen.dart';

class NotesInFolderScreen extends ConsumerWidget {
  const NotesInFolderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesService = ref.watch(notesServiceProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              label: Text("Search notes"),
                              suffixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            style: TextStyle(backgroundColor: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: notesService.notesInFolder.length,
                        itemBuilder: (context, index) => Card(
                              borderOnForeground: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide(width: 1.0)),
                              child: InkWell(
                                  onTap: () {
                                    notesService.getNotes(
                                        notesService.notesInFolder[index].id);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NotesScreen()));
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 150,
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                notesService
                                                    .notesInFolder[index].name,
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Gap(4)
                                            ],
                                          )))),
                            )),
                  ),
                ],
              ))),
    );
  }
}
