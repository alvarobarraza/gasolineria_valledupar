import 'package:flutter/material.dart';

import 'constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color textColor;

  const RoundedButton({Key key, this.text, this.press, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kblue,
        borderRadius: BorderRadius.circular(29)
      ),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }
}
