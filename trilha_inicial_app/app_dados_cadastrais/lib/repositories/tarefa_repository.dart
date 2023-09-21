import 'package:primeiro_app/model/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<void> adicionar(Tarefa tarefa) async {
    await Future.delayed(const Duration(milliseconds: 10));
    _tarefas.add(tarefa);
  }

  void alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.where((element) => element.getId() == id).first.setConcluido(concluido);
  }

  Future<List<Tarefa>> listar() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tarefas;
  }
}
