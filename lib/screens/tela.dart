import 'package:flutter/material.dart';
import 'package:flutter_alura/data/task_inherited.dart';
import 'package:flutter_alura/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  InitialScreen({super.key});
  double barTotal = 0;

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: false,
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.white),
        title: const Text('Tarefas'),
        actions: [
          SizedBox(
            width: 200,
            child: LinearProgressIndicator(
              value: widget.barTotal / 100,
              color: Colors.white,
              backgroundColor: Colors.white30,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.barTotal = TaskInherited.of(context)!.abc();
              });
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 70,
        ),
        child: ListView(
          children: TaskInherited.of(context)!.taskList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
