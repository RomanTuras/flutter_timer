import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_timer/core/constants.dart';

class Button extends StatelessWidget {
  final String caption;
  final String pathToIcon;
  final void Function() callback;

  const Button(this.caption, this.pathToIcon, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthBtn,
      height: heightBtn,
      child: TextButton(
        style: buttonStyle,
        onPressed: () {
          callback();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              pathToIcon,
              width: widthIcon,
              height: heightIcon,
              colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn),
            ),
            Text(
              caption.toUpperCase(),
              style: textStyleBtn,
            ),
          ],
        ),
      ),
    );
  }
}
