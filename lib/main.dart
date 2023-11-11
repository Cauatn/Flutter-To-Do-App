// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter, nao fode',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: Duration(milliseconds: 500),
          child: ListView(
            children: [
              Task(
                  'Rezar',
                  'https://img.freepik.com/fotos-gratis/retrato-de-um-leao-gerado-por-ia_268835-4278.jpg?w=740&t=st=1699401574~exp=1699402174~hmac=cbb16e5b0a8c24ab8ef5e752acf14008c01c95bb7671f2544dda159166638b83',
                  1),
              Task(
                  'Sofrimento',
                  'https://media.kasperskydaily.com/wp-content/uploads/sites/94/2013/11/06144845/inferno.png',
                  4),
              Task(
                  'Fé',
                  'https://img.freepik.com/fotos-gratis/jovem-afro-americano-sentado-com-os-olhos-fechados-com-a-biblia-nas-maos_181624-24395.jpg?w=740&t=st=1699667219~exp=1699667819~hmac=4694625756f45c06a84071e31d1e550a270fd2acc1f4841c295625895a5749ab',
                  3)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                opacidade = !opacidade;
              });
            },
            backgroundColor: Colors.blue,
            child: Icon(Icons.remove_red_eye)),
      ),
    );
  }
}

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
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: (widget.dificuldade >= 1)
                                ? Colors.blue
                                : Colors.blue[100],
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: (widget.dificuldade >= 2)
                                ? Colors.blue
                                : Colors.blue[100],
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: (widget.dificuldade >= 3)
                                ? Colors.blue
                                : Colors.blue[100],
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: (widget.dificuldade >= 4)
                                ? Colors.blue
                                : Colors.blue[100],
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: (widget.dificuldade >= 5)
                                ? Colors.blue
                                : Colors.blue[100],
                          ),
                        ],
                      ),
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
