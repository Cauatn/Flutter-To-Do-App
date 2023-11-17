import 'package:flutter/material.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  final String taskName;
  final String foto;
  final int dificuldade;
  const Task(this.taskName, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Container(
          child: Stack(
            children: [
              Container(
                color: Colors.blue,
                height: 140,
              ),
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 200,
                            child: LinearProgressIndicator(
                              value: ((nivel / widget.dificuldade) / 10),
                              color: Colors.white,
                              backgroundColor: Colors.white30,
                            )),
                        Text(
                          'Nivel: $nivel',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      color: Colors.black26,
                      height: 100,
                      width: 80,
                      child: Image.network(widget.foto, fit: BoxFit.fill)),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        child: Text(widget.taskName,
                            style: TextStyle(
                                fontSize: 24, overflow: TextOverflow.ellipsis)),
                      ),
                      Difficulty(dificultyLevel: widget.dificuldade),
                    ],
                  )),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nivel++;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Icon(Icons.arrow_drop_up), Text('UP')],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
