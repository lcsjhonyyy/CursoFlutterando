import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoItem> todoItems = [
    TodoItem(title: 'Comprar leite'),
    TodoItem(title: 'Pagar contas de luz'),
    TodoItem(title: 'Estudar Flutter'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoItems[index].title),
            leading: Checkbox(
              value: todoItems[index].isCompleted,
              onChanged: (bool? value) {
                setState(() {
                  todoItems[index].isCompleted = value!;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewTodoItem();
        },
        tooltip: 'Adicionar Tarefa',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNewTodoItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _controller = TextEditingController();

        return AlertDialog(
          title: Text('Nova Tarefa'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Digite a nova tarefa',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Adicionar'),
              onPressed: () {
                setState(() {
                  todoItems.add(TodoItem(title: _controller.text));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class TodoItem {
  String title;
  bool isCompleted;

  TodoItem({
    required this.title,
    this.isCompleted = false,
  });
}
