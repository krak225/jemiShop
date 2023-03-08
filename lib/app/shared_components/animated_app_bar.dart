import 'package:flutter/material.dart';

class AnimatedAppBar extends StatelessWidget with PreferredSizeWidget{
  Function onPressed;

  AnimatedAppBar({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 80,
      child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: Colors.orange,
            ),
            onPressed: onPressed(),
          ),
          backgroundColor: Colors.orange,
          elevation: 0,
          titleSpacing: 0.0,
          title: Row(
            children: <Widget>[
              Text(
                "Dove ",
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1),
              ),
              Text(
                'Paradis',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1),
              ),
            ],
          ),
          actions: <Widget>[
            Icon(
              Icons.notifications,
              color: Colors.teal,
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: CircleAvatar(
                backgroundImage:NetworkImage('image_url'),
              ),
            ),
          ],
        ),
    );

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}