// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zezao',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter: Meus primeiros passos',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            Task('Rezar',
                'https://img.freepik.com/fotos-gratis/retrato-de-um-leao-gerado-por-ia_268835-4278.jpg?w=740&t=st=1699401574~exp=1699402174~hmac=cbb16e5b0a8c24ab8ef5e752acf14008c01c95bb7671f2544dda159166638b83'),
            Task('Sofrimento', ''),
            Task('Fé', '')
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String taskName;
  final String foto;
  const Task(this.taskName, this.foto, {super.key});

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
                              value: nivel / 10,
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
                            color: Colors.blue,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.blue,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.blue,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.blue,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.blue,
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
