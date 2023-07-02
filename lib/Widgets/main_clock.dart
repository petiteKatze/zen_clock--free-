import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainClock extends StatelessWidget {
  final double width;
  final bool dot;
  final List<String> tim;
  final Brightness brightness;
  const MainClock(
      {required this.tim,
      required this.dot,
      required this.width,
      required this.brightness,
      super.key});

  @override
  Widget build(BuildContext context) {
    return brightness == Brightness.dark
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            key: const ValueKey("Main display clock"),
            children: [
              SvgPicture.asset(
                'lib/Assets/Numbers/${tim[0]}.svg',
                width: width / 5,
              ),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                "lib/Assets/Numbers/${tim[1]}.svg",
                width: width / 5,
              ),
              const SizedBox(
                width: 5,
              ),
              Opacity(
                opacity: dot ? 1 : 0,
                child: SvgPicture.asset(
                  "lib/Assets/Numbers/dots.svg",
                  width: width / 20,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                "lib/Assets/Numbers/${tim[2]}.svg",
                width: width / 5,
              ),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                "lib/Assets/Numbers/${tim[3]}.svg",
                width: width / 5,
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            key: const ValueKey("Main display clock light mode"),
            children: [
              SvgPicture.asset(
                'lib/Assets/NumbersLight/${tim[0]}.svg',
                width: width / 5,
              ),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                "lib/Assets/NumbersLight/${tim[1]}.svg",
                width: width / 5,
              ),
              const SizedBox(
                width: 5,
              ),
              Opacity(
                opacity: dot ? 1 : 0,
                child: SvgPicture.asset(
                  "lib/Assets/NumbersLight/dots.svg",
                  width: width / 20,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                "lib/Assets/NumbersLight/${tim[2]}.svg",
                width: width / 5,
              ),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                "lib/Assets/NumbersLight/${tim[3]}.svg",
                width: width / 5,
              )
            ],
          );
  }
}
