import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;

  ActionButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
     backgroundColor: Colors.grey
      ),
      child: Text(label),
    );
  }
}