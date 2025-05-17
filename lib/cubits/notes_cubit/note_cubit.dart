
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/constants.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NotesState> {
  NoteCubit() : super(NotesInitial());
List<NoteModel>?notes;
   fetchAllNotes()  {
   
      var notesBox = Hive.box<NoteModel>(kNotesBox);
       notes = notesBox.values.toList();
       emit(NoteSuccess());
     
  }
}
