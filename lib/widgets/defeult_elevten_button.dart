import 'package:flutter/material.dart';
import 'package:flutter_application_1/App_theme.dart';

class DefeultElevtenButton extends StatelessWidget {
  DefeultElevtenButton({required this.onPressed, required this.label});
  VoidCallback onPressed;
  String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.sizeOf(context).width, 52,)
        ),
        
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w400, color: AppTheme.white),
        ));
  }
}
