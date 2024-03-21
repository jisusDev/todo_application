import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import "dart:convert";

class TodoData extends StatefulWidget {
  const TodoData({Key? key}) : super(key: key);

  @override
  State<TodoData> createState() => _TodoDataState();
}

class _TodoDataState extends State<TodoData> {
  List<dynamic> todos = [];

  @override
  void initState() {
    super.initState();
    downloadData();
  }

  Future<void> downloadData() async {
    try {
      Response<String> response =
          await Dio().get('https://jsonplaceholder.typicode.com/todos');
      print('Contenido de la respuesta: ${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.data!);
        print('Tipo de datos recibidos: ${jsonData.runtimeType}');
        setState(() {
          todos = jsonData;
        });
      } else {
        print("Error al cargar los datos: ${response.statusCode}");
      }
    } catch (e) {
      print("Error al cargar el archivo Json: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.5),
            child: CheckboxListTile(
              activeColor: Colors.greenAccent,
              title: Text(
                todos[index]['title'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: todos[index]['completed']
                      ? const Color.fromARGB(255, 193, 191, 191)
                      : const Color.fromARGB(255, 56, 56, 56),
                ),
              ),
              value: todos[index]['completed'],
              onChanged: (newValue) {
                setState(() {
                  todos[index]['completed'] = newValue;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
