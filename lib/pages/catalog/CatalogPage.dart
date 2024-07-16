import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';


@RoutePage()
class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Catalog'),);
  }
}