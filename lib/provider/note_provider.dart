import 'package:flutter/material.dart';
import 'package:notes_demo/model/note_model.dart';

class NoteProvider extends ChangeNotifier{
  final List<Note> _notes = [];

  // Access Notes List Outside the Class
  List<Note> get notes => _notes;

  // Add New Notes
  void addNote(Note note){
    _notes.add(note);
    notifyListeners();
  }

  // To Be Implemented
  // void updateNote(Note updatedNote){}

  // Delete Notes
  void deleteNote(String id){
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }
}