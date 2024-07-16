import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
      height: 40,
      child: TextField(
        textAlign: TextAlign.start,
       controller: _searchController,
       decoration: InputDecoration(
        hintText: "Search",
        fillColor: Colors.grey,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => _searchController.clear(),
          ),
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Perform the search here
            },
          ),
          
          
      

       ),


      ),);
  }
}
