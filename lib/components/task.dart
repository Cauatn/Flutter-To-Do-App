import 'package:flutter/material.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  final String taskName;
  final String foto;
  final int dificuldade;
  Task(this.taskName, this.foto, this.dificuldade, {super.key});
  int nivel = 0;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
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
                      SizedBox(
                          width: 200,
                          child: LinearProgressIndicator(
                            value: ((widget.nivel / widget.dificuldade) / 10),
                            color: Colors.white,
                            backgroundColor: Colors.white30,
                          )),
                      Text(
                        'Nivel: ${widget.nivel}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black26,
                  height: 100,
                  width: 80,
                  child: assetOrNetwork()
                      ? Image.asset(widget.foto, fit: BoxFit.cover)
                      : Image.network(widget.foto, fit: BoxFit.cover),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(widget.taskName,
                          style: const TextStyle(
                              fontSize: 24, overflow: TextOverflow.ellipsis)),
                    ),
                    Difficulty(dificultyLevel: widget.dificuldade),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.nivel++;
                    });
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_drop_up),
                      Text('UP'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
