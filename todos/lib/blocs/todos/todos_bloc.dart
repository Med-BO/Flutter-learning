import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/todos_model.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  void _onLoadTodos(LoadTodos event, Emitter<TodosState> emit) {
    emit(
      TodosLoaded(todos: event.todos),
    );
  }

  void _onAddTodo(AddTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      List<Todo> newTodosList = List.from(state.todos);
      newTodosList.add(event.todo);
      emit(
        TodosLoaded(
          todos: newTodosList,
        ),
      );
    }
  }

  void _onUpdateTodo(UpdateTodo event, Emitter<TodosState> emit) {}

  void _onDeleteTodo(DeleteTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      List<Todo> newTodosList = List.from(state.todos);
      newTodosList.remove(event.todo);
      emit(
        TodosLoaded(
          todos: newTodosList,
        ),
      );
    }
  }
}
