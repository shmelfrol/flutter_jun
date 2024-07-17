import 'package:flutter/material.dart';


class MobileMenu extends StatelessWidget {
  const MobileMenu({
    super.key,
  });

 @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              MobileMenuItem(title: "Глвная",),
              const Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                ),
              ),
              MobileMenuItem(title: "Каталог",),
              MobileMenuItem(title: "Подборка",),
              const Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2020 | Santos Enoque',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileMenuItem extends StatelessWidget {
  String title;
  MobileMenuItem({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {print(title);},
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}