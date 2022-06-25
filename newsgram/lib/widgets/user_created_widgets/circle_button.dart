import 'package:flutter/material.dart';

class CircleButtonMenu extends StatelessWidget {
  CircleButtonMenu({Key? key,
    required this.size,
    required this.icon,
    required this.onPressed,
    required this.tooltip
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;
  final size ;
  String tooltip;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // margin: const EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
        margin: const EdgeInsets.only(left: 15),
        decoration:
            BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
        child: Center(
          child: IconButton(
            icon: Icon(icon, color: Colors.black87),
            iconSize: this.size,
            onPressed: onPressed,
            hoverColor: Colors.blue,
            tooltip: ('${tooltip}'),
            // splashRadius: 0.1,
          ),
        ),
      ),
    );
  }
}
