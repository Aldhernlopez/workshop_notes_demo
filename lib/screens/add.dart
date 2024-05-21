import 'package:flutter/material.dart';
import 'package:notes_demo/model/note_model.dart';
import 'package:notes_demo/provider/note_provider.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {

  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  // Creating Controllers to Access Data from TextFormField
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  // Creating Form Key to Validate TextFormField Entries
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    // Provider Class Object to Access Functions
    final noteProvider = Provider.of<NoteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                // Read Note Title
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Title Cannot be Null";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Read Note Content
                TextFormField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                    labelText: "Content",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Content Body Cannot be Null";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        final title = _titleController.text;
                        final content = _contentController.text;

                        noteProvider.addNote(
                            Note(
                                id: DateTime.now().toString(),
                                title: title,
                                content: content,
                            ),
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
