import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartBtnWidget extends StatelessWidget {
  const CartBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          IconButton(
            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
            icon: const Icon(
            CupertinoIcons.cart,
            color: Colors.black,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ), 
            onPressed: () { print("Pressed"); }),
            Positioned(
              left:25,
              bottom: 21,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child:  Center(
                  child: const Text(
                    '10',
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 8, 
                  ),),
                ),
                
              ),
            )
        ],
      ),
    );
  }
}


