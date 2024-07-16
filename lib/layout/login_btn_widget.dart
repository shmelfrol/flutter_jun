import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBtnWidget extends StatelessWidget {
  const LoginBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){print(context.router.currentPath);},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.green)

      ), 
      child: const Text('Войти', style: TextStyle(color: Colors.black),),
      );
  }
}
