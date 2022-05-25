import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(title: 'Material Banner Playground'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(elevation: 0, title: Text(widget.title)),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.notifications),
          onPressed: () => _showMaterialBanner(context),
        ),
        body: Container(
          color: Colors.blueGrey,
          child: const Center(
            child: Text(
              'Material Banner Test',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      );
}

void _showMaterialBanner(BuildContext context) {
  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      content: const Text('Material Banner Test'),
      leading: const Icon(Icons.notifications),
      contentTextStyle: const TextStyle(color: Colors.black),
      forceActionsBelow: true,
      actions: [
        TextButton(
          onPressed: () => ScaffoldMessenger.of(context).clearMaterialBanners(),
          child: const Text('Dismiss'),
        ),
      ],
    ),
  );
}
