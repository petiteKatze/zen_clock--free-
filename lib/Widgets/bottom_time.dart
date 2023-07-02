import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomTime extends StatelessWidget {
  final Brightness brightness;
  final double width;
  final List<String> tim;
  final List<String> date;

  const BottomTime(
      {required this.brightness,
      required this.date,
      required this.tim,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return brightness == Brightness.dark
        ? Row(
            children: [
              SvgPicture.asset(
                'lib/Assets/Numbers/${tim[4]}.svg',
                width: width / 40,
              ),
              SizedBox(
                width: width / 40,
              ),
              SvgPicture.asset(
                'lib/Assets/Numbers/${tim[5]}.svg',
                width: width / 40,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(
                date[1],
                style: const TextStyle(color: Colors.white),
              ),
            ],
          )
        : Row(
            children: [
              SvgPicture.asset(
                'lib/Assets/NumbersLight/${tim[4]}.svg',
                width: width / 40,
              ),
              SizedBox(
                width: width / 40,
              ),
              SvgPicture.asset(
                'lib/Assets/NumbersLight/${tim[5]}.svg',
                width: width / 40,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(
                date[1],
                style: const TextStyle(color: Colors.black),
              ),
            ],
          );
  }
}
