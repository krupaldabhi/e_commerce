import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String lablelText;
  final String hintText;
  final Icon icon;

  const CustomTextField({ required this.lablelText ,
    required this.hintText , required this.icon });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lablelText,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          keyboardType: TextInputType.phone ,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFF6368D9),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
