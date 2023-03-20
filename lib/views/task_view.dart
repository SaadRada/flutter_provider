import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(taskProvider.tasks[index].name),
                trailing: Checkbox(
                  value: taskProvider.tasks[index].isCompleted,
                  onChanged: (value) {
                    taskProvider.toggleTask(index);
                  },
                ),
                onLongPress: () {
                  taskProvider.removeTask(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-task');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
