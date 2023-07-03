import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainClock extends StatelessWidget {
  final double width;
  final bool dot;
  final List<String> tim;
  final Brightness brightness;
  final bool scene;
  const MainClock(
      {required this.tim,
      required this.dot,
      required this.width,
      required this.brightness,
      required this.scene,
      super.key});

  @override
  Widget build(BuildContext context) {
    return brightness == Brightness.dark
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            key: const ValueKey("Main display clock"),
            children: [
              Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'lib/Assets/Numbers/${tim[0]}.svg',
                      width: width / 5,
                    ),
                  ),
                  !scene
                      ? Center(
                          child: Container(
                            height: 5,
                            width: width / 5,
                            color: const Color(0xFF000000),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'lib/Assets/Numbers/${tim[1]}.svg',
                      width: width / 5,
                    ),
                  ),
                  !scene
                      ? Center(
                          child: Container(
                            height: 5,
                            width: width / 5,
                            color: const Color(0xFF000000),
                          ),
                        )
                      : const SizedBox(),
                ],
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
              Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'lib/Assets/Numbers/${tim[2]}.svg',
                      width: width / 5,
                    ),
                  ),
                  !scene
                      ? Center(
                          child: Container(
                            height: 5,
                            width: width / 5,
                            color: const Color(0xFF000000),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'lib/Assets/Numbers/${tim[3]}.svg',
                      width: width / 5,
                    ),
                  ),
                  !scene
                      ? Center(
                          child: Container(
                            height: 5,
                            width: width / 5,
                            color: const Color(0xFF000000),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            key: const ValueKey("Main display clock light mode"),
            children: [
              Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'lib/Assets/NumbersLight/${tim[0]}.svg',
                      width: width / 5,
                    ),
                  ),
                  !scene
                      ? Center(
                          child: Container(
                            height: 5,
                            width: width / 5,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'lib/Assets/NumbersLight/${tim[1]}.svg',
                      width: width / 5,
                    ),
                  ),
                  !scene
                      ? Center(
                          child: Container(
                            height: 5,
                            width: width / 5,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      : const SizedBox(),
                ],
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
              Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'lib/Assets/NumbersLight/${tim[2]}.svg',
                      width: width / 5,
                    ),
                  ),
                  !scene
                      ? Center(
                          child: Container(
                            height: 5,
                            width: width / 5,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'lib/Assets/NumbersLight/${tim[3]}.svg',
                      width: width / 5,
                    ),
                  ),
                  !scene
                      ? Center(
                          child: Container(
                            height: 5,
                            width: width / 5,
                            color: const Color(0xFFFFFFFF),
                          ),
                        )
                      : const SizedBox(),
                ],
              )
            ],
          );
  }
}
