import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.startQuize,
  });

  final void Function() startQuize;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 23,
            children: [
          Image(
            image: AssetImage(
              "assets/images/quiz.png",
            ),
            height: 250,
            width: 250,
          ),
          Text(
            "Let's Start Quize",
            style: TextStyle(fontSize: 34,color: Colors.white),
          ),
          OutlinedButton.icon(
            onPressed: startQuize,
            icon: Icon(Icons.arrow_forward),
            label: Text("start quiz", style: TextStyle(fontSize: 18),), style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          )
        ]));
  }
}
