import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Context Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      final color = Theme.of(context).primaryColor;
    });
  }

  void showMyDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Alert'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Context Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center, // 1. center 가 먹히지 않음
        children: [
          Row(), // 2. CrossAxisAlignment.center를 대신하여 적어주면 center 가 적용된다.
          ElevatedButton(
            child: const Text('Show Dialog'),
            onPressed: () {
              showMyDialog();
            },
          ),
          const Simple()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Floating Action Button Pressed'),
            ),
          );
        },
        tooltip: 'Show Dialog',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Simple extends StatelessWidget {
  const Simple({Key? key}) : super(key: key);

  void showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Alert'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Simple Button'),
      onPressed: () {
        showMyDialog(context);
      },
    );
  }
}
