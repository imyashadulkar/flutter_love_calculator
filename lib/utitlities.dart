import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

IconButton Button(
  String buttonName,
  IconData iconData,
  Color buttonColor,
  VoidCallback _function,
) {
  return IconButton(
    icon: Icon(iconData),
    iconSize: 100.0,
    onPressed: _function,
    tooltip: buttonName,
    color: buttonColor,
  );
}

class getName extends StatelessWidget {
  const getName({
    Key? key,
    required this.hint,
    required TextEditingController name,
  })  : _name = name,
        super(key: key);

  final String hint;
  final TextEditingController _name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.text,
        inputFormatters: [
          // FilteringTextInputFormatter(RegExp("[a-z A-Z]")),
          FilteringTextInputFormatter(
            RegExp(r'[a-z,A-Z]'),
            allow: true,
          ),
        ],
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        controller: _name,
      ),
    );
  }
}
