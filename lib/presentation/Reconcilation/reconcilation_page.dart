import 'package:flutter/material.dart';

class ReconcilationPage extends StatelessWidget {
  const ReconcilationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 200,
                  color: Colors.amber,
                  child: const Center(child: Text("Upload (File A)")),
                ),
                Container(
                  height: 100,
                  width: 200,
                  color: Colors.amberAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
