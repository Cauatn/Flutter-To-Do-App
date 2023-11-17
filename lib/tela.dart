// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
