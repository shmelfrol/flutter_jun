import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Selection'),);;
  }
}