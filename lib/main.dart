import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integer Input Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntegerInputDemo(),
    );
  }
}

class IntegerInputDemo extends StatefulWidget {
  const IntegerInputDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntegerInputDemoState createState() => _IntegerInputDemoState();
}

class _IntegerInputDemoState extends State<IntegerInputDemo> {
  TextEditingController firstValueController = TextEditingController();
  TextEditingController secondValueController = TextEditingController();

  void _submitValues() {
    int firstValue = int.tryParse(firstValueController.text) ?? 0;
    int secondValue = int.tryParse(secondValueController.text) ?? 0;
    int sum = firstValue + secondValue;

    // Handle the submitted values
    //print("First value: $firstValue");
    //print("Second value: $secondValue");
    // You can perform any further actions with the submitted values here
    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Submitted Values'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('First Value: $firstValue'),
              Text('Second Value: $secondValue'),
              Text('Sum of two Values: $sum'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    firstValueController.dispose();
    secondValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Integer Input Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: firstValueController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'First Value',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: secondValueController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Second Value',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitValues,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
