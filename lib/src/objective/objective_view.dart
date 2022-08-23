import 'package:flutter/material.dart';

class ObjectiveView extends StatefulWidget {
  const ObjectiveView({Key? key}) : super(key: key);

  @override
  State<ObjectiveView> createState() => _ObjectiveViewState();
}

class _ObjectiveViewState extends State<ObjectiveView> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Objective"));
  }
}
