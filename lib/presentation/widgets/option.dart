// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.optionParameter,
    required this.onTap,
  });
  final String optionParameter;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container( width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 241, 237, 241),
                backgroundColor: Colors.deepPurple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
            child: Text(
              optionParameter, style: TextStyle(fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
