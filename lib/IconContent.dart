import 'package:flutter/material.dart';


class IconContent extends StatelessWidget {
  IconContent({required this.gender,required this.genderIcon});

  final String gender;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,style: TextStyle(
            fontSize: 18.0
        ),
        ),
      ],
    );
  }
}
