import 'package:flutter/material.dart';

class TodoHeaderWidget extends StatelessWidget {
  const TodoHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "TODO",
          style: TextStyle(fontSize: 40.0),
        ),
      ],
    );
  }
}
