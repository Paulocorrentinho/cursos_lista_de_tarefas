import 'package:flutter/material.dart';
import 'package:todo_list2/models/todo.dart';
import 'package:todo_list2/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController =
      TextEditingController(); //cria um controlador

  List<Todo> todos = [];      //cria uma lista

  @override
  Widget build(BuildContext context) {
    return SafeArea(     //impede o app de entrar na area dos icones de horario, etc
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(     //widget que define a largura necessaria para o campo de texto
                      child: TextField(
                        controller: todoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Ex. Estudar Flutter',
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        String text = todoController.text;      //cria uma variavel para armazenamento
                        setState(() {
                          Todo newTodo = Todo(
                            title: text,
                            dateTime: DateTime.now(),
                          );
                          todos.add(newTodo); //adiciona os itens na lista
                        });
                        todoController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00d7f3),
                        //fixedSize: Size(100, 200),     //define o tamanho do botao
                        padding: EdgeInsets.all(14),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),      //da um espasamento de altura entre as rows
                Flexible(
                  child: ListView(     //cria uma lista com rolamento dos itens
                    shrinkWrap: true,      //define o tamanho de uma lista de acordo com a quantidade de itens
                    children: [
                      for (Todo todo in todos)
                        TodolistItem(
                          todo: todo,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Você possui ${todos.length} tarefas pendentes', //conta os itens da lista
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00d7f3),
                        //fixedSize: Size(100, 200),     //define o tamanho do botao
                        padding: EdgeInsets.all(14),
                      ),
                      child: Text('Limapr tudo'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
