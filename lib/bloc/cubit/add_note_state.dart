part of 'add_note_cubit.dart';

abstract class AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteLoaded extends AddNoteState {
  List<GetTodoModel> model;
  AddNoteLoaded({
    required this.model,
  });
}
