import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todos/blocs/blocs.dart';
import 'package:todos/models/models.dart';
import 'package:todos/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc patterns- todos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddTodoScreen()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return const CircularProgressIndicator();
          } else if (state is TodosLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Pending To Dos: ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _todoCard(state.todos[index], context);
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Text(
              'Todos could not be loaded! Please restart the app',
            );
          }
        },
      ),
    );
  }

  Card _todoCard(Todo todo, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '#${todo.id}: ${todo.task}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_task),
              ),
              IconButton(
                onPressed: () {
                  context.read<TodosBloc>().add(DeleteTodo(todo: todo));
                },
                icon: const Icon(Icons.cancel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
