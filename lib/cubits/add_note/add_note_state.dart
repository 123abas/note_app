
part of 'add_note_cubit.dart';
//import 'package:flutter/widgets.dart';

//@immutable
abstract class AddNoteState {
  
}
class AddNoteInitial extends AddNoteState{}
class AddNoteLoading extends AddNoteState{}
class AddNoteSuccess extends AddNoteState{}
class AddNoteFailure extends AddNoteState{

  final String errorMessage;

  AddNoteFailure( this.errorMessage);
}