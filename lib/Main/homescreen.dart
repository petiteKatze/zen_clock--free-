import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zen_clock/Main/detailsscreen.dart';
import 'package:zen_clock/Main/timerscreen.dart';
import 'package:zen_clock/Widgets/bottom_time.dart';
import 'package:zen_clock/Widgets/main_clock.dart';

bool _dot = false;
List<String> tim = ["0", "0", "0", "0", "0", "0"];
List<String> date = ["Zen", "Clock"];
bool _isAudioPlayingStarted = false;
AudioPlayer _player = AudioPlayer();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timerone;
  @override
  void initState() {
    _isAudioPlayingStarted = false;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _player = AudioPlayer();
    _timerone = Timer.periodic(const Duration(seconds: 1), (Timer timerinit) {
      DateTime timeNow = DateTime.now();
      var hour = DateFormat("hhmmss").format(timeNow);
      var date1 = DateFormat("EEEE a").format(timeNow);

      if (_dot == true) {
        setState(() {
          _dot = false;
          tim = hour.split("").toList();
          date = date1.split(" ").toList();
        });
      } else {
        setState(() {
          _dot = true;
          tim = hour.split("").toList();
          date = date1.split(" ").toList();
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _timerone.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final Brightness brightness = Theme.of(context).brightness;
    return GestureDetector(
      onTap: () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      },
      onPanUpdate: (details) async {
        if (kDebugMode) {
          print(details.delta.dx);
        }
        if (kDebugMode) {
          print(details.delta.dy);
        }
        if (details.delta.dx < -20) {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  child: const TimerPage(), type: PageTransitionType.fade));
        }
        if (details.delta.dy < -30) {
          Navigator.push(
              context,
              PageTransition(
                  child: const DetailsScreen(),
                  type: PageTransitionType.bottomToTop));
        }
      },
      child: Scaffold(
        backgroundColor:
            brightness == Brightness.dark ? Colors.black : Colors.white,
        body: SafeArea(
          top: false,
          bottom: true,
          child: Stack(children: [
            Center(
                child: MainClock(
              tim: tim,
              dot: _dot,
              width: width,
              brightness: brightness,
            )),
            Positioned(
                bottom: width / 40,
                left: width / 20,
                right: width / 20,
                child: Row(
                  children: [
                    Text(
                      date[0],
                      style: TextStyle(
                          color: brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                    Opacity(
                      opacity: _isAudioPlayingStarted ? 1 : 0.5,
                      child: IconsOutlineButton(
                        onPressed: () async {
                          if (_isAudioPlayingStarted == true) {
                            setState(() {
                              _isAudioPlayingStarted = false;
                            });
                            if (_player.playing) {
                              await _player.pause();
                            }
                          } else {
                            if (!_player.playing) {
                              setState(() {
                                _isAudioPlayingStarted = true;
                              });

                              if (_player.duration == null) {
                                await _player
                                    .setAsset("lib/Assets/Audio/main.mp3");
                                await _player.setLoopMode(LoopMode.one);
                                await _player.play();
                              } else {
                                await _player.play();
                              }
                            }
                          }
                        },
                        text: "",
                        iconData: Icons.multitrack_audio_sharp,
                        color: Colors.transparent,
                      ),
                    ),
                    const Spacer(),
                    BottomTime(
                        brightness: brightness,
                        date: date,
                        tim: tim,
                        width: width)
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
