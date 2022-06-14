import 'package:flutter/material.dart';

class CircleButtonMenu extends StatelessWidget {
  CircleButtonMenu({Key? key,
    required this.size,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;
  final size ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // margin: const EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
        margin: EdgeInsets.only(right: 10),
        decoration:
            BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
        child: Center(
          child: IconButton(
            icon: Icon(icon, color: Colors.black87),
            iconSize: this.size,
            onPressed: onPressed,
            hoverColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
