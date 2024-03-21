import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text('data'),
            ),
            Container(
              height: 80,
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 50,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isOk().then((value) {
            print(value);
          });
        },
      ),
    );
  }

  Future<int> isOk() async {
    int a = 5;
    await Future.delayed(const Duration(seconds: 5));
    return a;
  }
}
