import 'package:flutter/material.dart';
import '../UI/flushbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // create a List of items.
  late final List<String> items;

  @override
  void initState() {
    items = List.generate(
      20,
      (index) => "ListTitle index ${index + 1}",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Telegram Undo"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Card(
                child: ListTile(
                  title: Text(
                    items[index],
                    style: const TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.numbers_sharp),
                  trailing: IconButton(
                    onPressed: () {
                      final temp = items.removeAt(index);
                      FlushBars.undo(
                        message: "You still have a chance to undo it!",
                        onUndo: () {
                          Navigator.pop(context);
                          items.insert(index, temp);
                          setState(() {});
                        },
                        duration: const Duration(seconds: 6),
                      ).show(context);
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
