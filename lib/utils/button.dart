import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {super.key,
      required this.iconData,
      required this.onClicked,
      required this.index});

  final IconData iconData;
  final VoidCallback onClicked;
  var index;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(255, 141, 199, 1),
        elevation: 0,
      ),
      onPressed: ((index == 0 && iconData == Icons.arrow_back) ||
              index == 4667 && iconData == Icons.arrow_forward)
          ? null
          : onClicked,
      child: Icon(iconData),
    );
  }
}
