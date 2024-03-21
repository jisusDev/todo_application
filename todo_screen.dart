import 'package:flutter/material.dart';
import 'package:todo_application/Data/data.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

bool? isChecked = false;

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String day = DateFormat('dd').format(now);
    String monthYear = DateFormat('MMM yyyy').format(now);
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                day,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Color.fromARGB(255, 96, 96, 96),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Column(
                children: [
                  Text(
                    monthYear.split(" ")[0],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    monthYear.split(" ")[1],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 16),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                DateFormat("EEEE").format(now),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 112, 112, 112),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const TodoData(),
        ],
      ),
    );
  }
}
