import 'package:flutter/material.dart';
import 'package:notes_demo/provider/note_provider.dart';
import 'package:notes_demo/screens/add.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

        // Using Consumer Widget So Only ListView is Rebuilt on notifyListeners()
        child: Consumer<NoteProvider>(
          builder: (context, noteProvider, _) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final note = noteProvider.notes[index];
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.content),
                      trailing: IconButton(
                        onPressed: (){
                          noteProvider.deleteNote(note.id);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 5);
              },
              itemCount: noteProvider.notes.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context)
              .push(
              MaterialPageRoute(
                  builder: (context) => const AddScreen(),
              ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
