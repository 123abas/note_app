import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/add_note_bottom_shheet.dart';
import 'package:note_app/widgets/colors_listView.dart';
import 'package:note_app/widgets/constants.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';
import 'package:note_app/widgets/edit_note_color_list.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.editNote});
  final NoteModel editNote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditViewBody(editNote: editNote));
  }
}

//editBody-----------------------------------------------
class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.editNote});
  final NoteModel editNote;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? content, title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            onPressed: () {
              widget.editNote.title = title ?? widget.editNote.title;
              widget.editNote.subTitle = content ?? widget.editNote.subTitle;
              widget.editNote.save();
              BlocProvider.of<NoteCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(height: 60),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hint: widget.editNote.title,
          ),
          const SizedBox(height: 24),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hint: widget.editNote.subTitle,
            maxLines: 6,
          ),
          const SizedBox(height: 20,),
        EditNoteColorsList(note: widget.editNote,),
        ],
      ),
    );
  }
}
