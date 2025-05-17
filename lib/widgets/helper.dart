// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:note_app/cubits/add_note/add_note_cubit.dart';
// import 'package:note_app/models/note_model.dart';

// class AddNoteBottomSheet extends StatelessWidget {
//   AddNoteBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AddNoteCubit(),
//       create: (context) {
//         try {
//           debugPrint('Creating NoteCubit at ${DateTime.now()}');
//           return AddNoteCubit();
//         } catch (e) {
//           debugPrint('Error creating NoteCubit: $e');
//           rethrow;
//         }
//       },

//       child: BlocConsumer<AddNoteCubit, AddNoteState>(
//         listener: (context, state) {
//           if (state is AddNoteSuccess) {
//             Navigator.pop(context);
//           }
//           if (state is AddNoteFailure) {
//             print('faild${state.errorMessage}');

//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('فشل: ${state.errorMessage}')),
//             );
//           }
//         },
//         builder: (context, state) {
//           return AbsorbPointer(
//             absorbing: state is AddNoteLoading?true:false,
//             child: Padding(
//               padding: EdgeInsets.only(left: 16,right: 16,bottom: MediaQuery.of(context).viewInsets.bottom),
//               child: SingleChildScrollView(child: AddNoteForm()),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// //Note Foorm------------------------------
// class AddNoteForm extends StatefulWidget {
//   const AddNoteForm({super.key});

//   @override
//   State<AddNoteForm> createState() => _AddNoteFormState();
// }

// class _AddNoteFormState extends State<AddNoteForm> {
//   final GlobalKey<FormState> formKey = GlobalKey();
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
//   String? title, subTitle;
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       autovalidateMode: autovalidateMode,
//       key: formKey,
//       child: Column(
//         children: [
//           const SizedBox(height: 24),
//           CustomTextField(
//             onSaved: (value) {
//               title = value;
//             },
//             hint: 'Title',
//           ),
//           const SizedBox(height: 16),
//           CustomTextField(
//             onSaved: (value) {
//               subTitle = value;
//             },
//             hint: 'content',
//             maxLines: 6,
//           ),
//           const SizedBox(height: 40),
//           //BottunSheet------
//           BlocBuilder<AddNoteCubit, AddNoteState>(
//             builder: (context, state) {
//               return CustomBottunSheet(
//                 isLoading: state is AddNoteLoading ? true : false,
//                 onTap: () {
//                   if (formKey.currentState!.validate()) {
//                     formKey.currentState!.save();

//                     var noteModel = NoteModel(
//                       title: title!,
//                       subTitle: subTitle!,
//                       date: DateTime.now().toString(),
//                       color: Colors.blue.value,
//                     );
//                     BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
//                   } else {
//                     autovalidateMode = AutovalidateMode.always;
//                     setState(() {});
//                   }
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
// //textfield----------------------------------------------------------------textfield//

// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     super.key,
//     required this.hint,
//     this.maxLines = 1,
//     this.onSaved,
//   });
//   final String hint;
//   final int maxLines;
//   final void Function(String?)? onSaved;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onSaved: onSaved,
//       validator: (value) {
//         if (value?.isEmpty ?? true) {
//           return 'Field is required';
//         } else {
//           return null;
//         }
//       },
//       cursorColor: Color(0xff62FCD7),
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: TextStyle(color: Color(0xff62FCD7)),
//         border: buildBorder(),

//         enabledBorder: buildBorder(),
//         focusedBorder: buildBorder(Color(0xff62FCD7)),
//       ),
//     );
//   }

//   OutlineInputBorder buildBorder([Color]) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//       borderSide: BorderSide(color: Color ?? Colors.white),
//     );
//   }
// }

// //BottunSheet=----------------------------------------------CustomBottunSheet//
// class CustomBottunSheet extends StatelessWidget {
//   const CustomBottunSheet({super.key, this.onTap, this.isLoading = false});
//   final void Function()? onTap;
//   final bool isLoading;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 55,
//         decoration: BoxDecoration(
//           color: Color(0xff62FCD7),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Center(
//           child:
//               isLoading
//                   ? CircularProgressIndicator(color: Colors.black)
//                   : Text(
//                     'Add',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//         ),
//       ),
//     );
//   }
// }