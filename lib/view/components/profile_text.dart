import 'package:diyos/helper/style.dart';
import 'package:flutter/material.dart';

class ProfileText extends StatefulWidget {
  final String title;
  final String value;
  const ProfileText({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  State<ProfileText> createState() => _ProfileTextState();
}

class _ProfileTextState extends State<ProfileText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${widget.title}",style: KH3_bold,),
        SizedBox(height: 5,),
        Text("${widget.value}",style: KH3_medium,),
      ],
    );
  }
}
