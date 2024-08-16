import 'package:flutter/material.dart';

class ButtonsWidget extends StatefulWidget {
  final String buttonName;
  final VoidCallback onPressed;

  ButtonsWidget({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  _ButtonsWidgetState createState() => _ButtonsWidgetState();
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: MaterialButton(
          onPressed: widget.onPressed,
          child: Text(widget.buttonName),
          color: _isHovered ? Colors.grey[300] : Colors.white,  // Change color on hover
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
      ),
    );
  }
}
