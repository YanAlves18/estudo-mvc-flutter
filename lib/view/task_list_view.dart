import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../store/task_store.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskStore = Provider.of<TaskStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: taskStore.toggleShowCompletedTasks,
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          final visibleTasks = taskStore.visibleTasks;
          return ListView.builder(
            itemCount: visibleTasks.length,
            itemBuilder: (_, index) {
              final task = visibleTasks[index];
              return Observer(
                builder: (_) => CheckboxListTile(
                  title: Text(task.title),
                  value: task.completed,
                  onChanged: (_) => taskStore.toggleTaskCompletion(task),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTaskTitle = '';
        return AlertDialog(
          title: const Text('Adicionar tarefa'),
          content: TextField(
            onChanged: (value) {
              newTaskTitle = value;
            },
            decoration: const InputDecoration(
              labelText: 'Nome da tarefa',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Adicionar'),
              onPressed: () {
                if (newTaskTitle.isNotEmpty) {
                  final taskStore = Provider.of<TaskStore>(context, listen: false);
                  taskStore.addTask(newTaskTitle);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}