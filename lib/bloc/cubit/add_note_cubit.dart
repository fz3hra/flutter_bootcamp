import 'package:bloc/bloc.dart';
import 'package:flutter_bootcamp/models/get_todo_model.dart';
import 'package:meta/meta.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteLoading());
  void loadTodos() async {
    await Future.delayed(Duration(seconds: 2));
    final todos = [
      GetTodoModel(isChecked: false, todoTitle: 'testing'),
    ];
    emit(AddNoteLoaded(model: todos));
  }

  void addNote(GetTodoModel model) {
    if (state is AddNoteLoaded) {
      final todos = (state as AddNoteLoaded).model.toList()..add(model);
      emit(AddNoteLoaded(model: todos));
    }
  }
}
