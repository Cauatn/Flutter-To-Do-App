import 'package:flutter_alura/components/task.dart';
import 'package:flutter_alura/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String _tablename = 'taskTable';
  static const String _name = 'taskName';
  static const String _difficulty = 'taskDifficulty';
  static const String _image = 'taskImage';

  static String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  save(Task taskName) async {}

  delete(Task taskName) async {}

  Future<List<Task>> findAll() async {
    print('abrindo lista');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);
    print('procurando dados no banco de dados... encontrado $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    final List<Task> tarefas = [];

    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }

    return tarefas;
  }

  Future<List<Task>> find(String taskName) async {
    print('Acessando find: ');
    final Database database = await getDatabase();

    final List<Map<String, dynamic>> result = await database.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );

    print('Tarefa encontrada : ${toList(result)}');

    return toList(result);
  }
}
