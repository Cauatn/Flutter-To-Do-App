// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[600],
          title: Text(
            'asd',
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Caixa(Colors.red, Colors.green, Colors.blue),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Caixa extends StatelessWidget {
  final Color cor;
  final Color cor1;
  final Color cor2;

  const Caixa(this.cor, this.cor1, this.cor2, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tamanho = 300;
    return Container(
      width: tamanho,
      height: 200,
      child: Row(
        children: [
          Container(
            width: tamanho / 3,
            height: 200,
            color: cor,
          ),
          Container(
            width: tamanho / 3,
            height: 200,
            color: cor1,
          ),
          Container(
            width: tamanho / 3,
            height: 200,
            color: cor2,
          ),
        ],
      ),
    );
  }
}
