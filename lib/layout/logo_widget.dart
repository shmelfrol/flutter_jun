import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jun/router/app_router.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     width: 40,
     height: 40,
     decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(12)
     ),
     child: Stack(
      children: [
        InkWell(
          onTap: () {context.router.push(const MainRoute());},
        )
      ],
     ),
    );
  }
}
