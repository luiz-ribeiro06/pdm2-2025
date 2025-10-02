// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
  
   Map<String, dynamic> toJson() {
   return {
     "nome": _nome,
   };
 }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }
  
   Map<String, dynamic> toJson() {
   return {
     "nome": _nome,
     "dependentes": _dependentes.map((d) => d.toJson()).toList(),
   };
 }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }
  
  Map<String, dynamic> toJson() {
  return {
     "nomeProjeto": _nomeProjeto,
     "funcionarios": _funcionarios.map((f) => f.toJson()).toList(),
   };
 }
}

void main() {
  Dependente dependenteA = new Dependente("Alberto");
  Dependente dependenteB = new Dependente("Bruno");
  Dependente dependenteC = new Dependente("Carlos");
  
  Funcionario funcionarioA = new Funcionario("Ana", [dependenteA]);
  Funcionario funcionarioB = new Funcionario("Baltazar", [dependenteB]);
  Funcionario funcionarioC = new Funcionario("Cláudia", [dependenteC]);
  
  List<Funcionario> funcionarioList = [funcionarioA, funcionarioB, funcionarioC];
  EquipeProjeto equipe = new EquipeProjeto("App de Compras", funcionarioList);
  String jsonStr = jsonEncode(equipe.toJson());
}
