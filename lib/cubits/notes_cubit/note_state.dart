part of 'note_cubit.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}
class NoteSuccess extends NotesState{}
// class NoteLoading extends NotesState{}
// class NoteSuccess extends NotesState{

//   final List<NoteModel>notes;

//   NoteSuccess(this.notes);
// }
// class NoteFailure extends NotesState{

//   final String errorMessage;

//   NoteFailure( this.errorMessage);}