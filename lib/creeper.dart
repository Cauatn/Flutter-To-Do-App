// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Creeper extends StatelessWidget {
  const Creeper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Container(
          color: Colors.white,
          alignment: AlignmentDirectional.center,
          child: Container(
            width: 269,
            height: 269,
            alignment: AlignmentDirectional.topEnd,
            color: Colors.green,
            child: GridView.count(
              crossAxisCount: 8,
              children: [
                Caixa(color: Colors.green),
                Caixa(color: Colors.black),
                Caixa(color: Colors.black),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.black),
                Caixa(color: Colors.black),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.black),
                Caixa(color: Colors.black),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.black),
                Caixa(color: Colors.black),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.black),
                Caixa(color: Colors.black),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.black),
                Caixa(color: Colors.black),
                Caixa(color: Colors.black),
                Caixa(color: Colors.black),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.black),
                Caixa(color: Colors.black),
                Caixa(color: Colors.black),
                Caixa(color: Colors.black),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.black),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
                Caixa(color: Colors.black),
                Caixa(color: Colors.green),
                Caixa(color: Colors.green),
              ],
            ),
          ),
        ));
  }
}

class Caixa extends StatelessWidget {
  Caixa({
    super.key,
    required this.color,
  });

  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 37,
      height: 37,
    );
  }
}

class Teste extends StatelessWidget {
  Teste({
    super.key,
    required this.grid,
  });

  List<int> grid;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
