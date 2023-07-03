import "dart:async";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:just_audio/just_audio.dart";
import "package:material_dialogs/widgets/buttons/icon_outline_button.dart";
import "package:page_transition/page_transition.dart";
import "package:zen_clock/Main/homescreen.dart";
import "package:zen_clock/Widgets/main_clock.dart";

List<String> _tim = ["2", "5", "0", "0"];
int _minutes = 25;
int _seconds = 00;
bool _dot = true;
bool _started = false;
bool _isAudioPlayingStartedTime = false;
AudioPlayer _playerTime = AudioPlayer();
bool _sceneEnabled = false;
const _backgrounds = ["back1", "back2"];
int _backIndex = 0;

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late Timer _minutesTimer;
  late Timer _secondsTimer;
  late Timer _dotTimer;

  @override
  void initState() {
    setState(() {
      _backIndex = _backgrounds.length;
    });
    _isAudioPlayingStartedTime = false;
    _playerTime = AudioPlayer();
    _dot = true;
    _tim = ["2", "5", "0", "0"];
    _minutes = 25;
    _seconds = 00;
    _started = false;
    super.initState();
  }

  @override
  void dispose() {
    _playerTime.dispose();
    if (_started) {
      _minutesTimer.cancel();
      _secondsTimer.cancel();
      _dotTimer.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor:
          brightness == Brightness.dark ? Colors.black : Colors.white,
      body: GestureDetector(
        onTap: () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        },
        onPanUpdate: (details) async {
          if (details.delta.dx > 20) {
            if (_started) {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        contentTextStyle: TextStyle(
                          fontSize: 15,
                          color: brightness == Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                        titleTextStyle: TextStyle(
                          fontSize: 22,
                          color: brightness == Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        backgroundColor: brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white,
                        title: const Text("Are you sure?"),
                        content: SizedBox(
                          width: width / 3,
                          child: const Text(
                              "Quiting a Pomodoro is a bad idea, stay focused and try to finish your work. Are you sure you still want to quit this Pomodoro?"),
                        ),
                        actions: [
                          IconsOutlineButton(
                            onPressed: () {
                              _playerTime.dispose();
                              if (_started) {
                                _minutesTimer.cancel();
                                _secondsTimer.cancel();
                                _dotTimer.cancel();
                              }
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: const HomePage(),
                                      type: PageTransitionType.fade));
                            },
                            text: "I quit",
                            iconData: Icons.close,
                          )
                        ],
                      ));
            } else {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const HomePage(), type: PageTransitionType.fade));
            }
          }
        },
        onDoubleTap: () {
          if (brightness == Brightness.dark) {
            sceneChanger();
          } else {
            setState(() {
              _sceneEnabled = false;
              _backIndex = _backgrounds.length;
            });
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      contentTextStyle: TextStyle(
                        fontSize: 15,
                        color: brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      titleTextStyle: TextStyle(
                        fontSize: 22,
                        color: brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      actionsAlignment: MainAxisAlignment.center,
                      backgroundColor: brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white,
                      title: const Text("Change to dark theme"),
                      content: SizedBox(
                        width: width / 3,
                        child: const Text(
                            "To change backrgound scene, change your device theme to dark theme"),
                      ),
                      actions: [
                        IconsOutlineButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: "Close",
                          iconData: Icons.close,
                        )
                      ],
                    ));
          }
        },
        onLongPress: () {
          if (brightness == Brightness.dark) {
            sceneChanger();
          } else {
            setState(() {
              _sceneEnabled = false;
              _backIndex = _backgrounds.length;
            });
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      contentTextStyle: TextStyle(
                        fontSize: 15,
                        color: brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      titleTextStyle: TextStyle(
                        fontSize: 22,
                        color: brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      actionsAlignment: MainAxisAlignment.center,
                      backgroundColor: brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white,
                      title: const Text("Change to dark theme"),
                      content: SizedBox(
                        width: width / 3,
                        child: const Text(
                            "To change backrgound scene, change your device theme to dark theme"),
                      ),
                      actions: [
                        IconsOutlineButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: "Close",
                          iconData: Icons.close,
                        )
                      ],
                    ));
          }
        },
        child: Stack(
          children: [
            _sceneEnabled
                ? Image.asset(
                    width: width,
                    "lib/Assets/Backgrounds/${_backgrounds[_backIndex]}.jpg",
                    fit: BoxFit.cover)
                : const SizedBox(),
            _sceneEnabled
                ? Container(
                    color: const Color.fromARGB(87, 0, 0, 0),
                    width: width,
                    height: MediaQuery.of(context).size.height,
                  )
                : const SizedBox(),
            Positioned(
                top: width / 20,
                left: width / 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pomodoro",
                      style: TextStyle(
                        fontSize: 20,
                        color: brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                )),
            _started
                ? Positioned(
                    left: width / 20,
                    bottom: width / 40,
                    child: Opacity(
                      opacity: _isAudioPlayingStartedTime ? 1 : 0.5,
                      child: IconsOutlineButton(
                        onPressed: () async {
                          if (_isAudioPlayingStartedTime == true) {
                            setState(() {
                              _isAudioPlayingStartedTime = false;
                            });
                            if (_playerTime.playing) {
                              await _playerTime.pause();
                            }
                          } else {
                            if (!_playerTime.playing) {
                              setState(() {
                                _isAudioPlayingStartedTime = true;
                              });

                              if (_playerTime.duration == null) {
                                await _playerTime
                                    .setAsset("lib/Assets/Audio/cybercute.mp3");
                                _playerTime.setVolume(0.8);
                                await _playerTime.setLoopMode(LoopMode.one);
                                await _playerTime.play();
                              } else {
                                await _playerTime.play();
                              }
                            }
                          }
                        },
                        text: "",
                        iconData: Icons.multitrack_audio_sharp,
                        color: Colors.transparent,
                      ),
                    ),
                  )
                : const SizedBox(),
            Center(
              child: MainClock(
                  tim: _tim,
                  dot: _dot,
                  width: width,
                  brightness: brightness,
                  scene: _sceneEnabled),
            ),
            (!_started)
                ? Positioned(
                    bottom: width / 40,
                    right: width / 20,
                    child: IconsOutlineButton(
                      onPressed: () {
                        setState(() {
                          _started = true;
                          _dot = true;
                        });
                        timy();
                        _dotTimer =
                            Timer.periodic(const Duration(seconds: 1), (timer) {
                          if (_dot) {
                            setState(() {
                              _dot = false;
                            });
                          } else if (_dot == false) {
                            setState(() {
                              _dot = true;
                            });
                          }
                        });
                      },
                      text: "",
                      iconData: Icons.play_arrow,
                    ))
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  void timy() {
    start();
    _minutesTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (_minutes > 0) {
        _minutes = _minutes - 1;

        List<String> minutesString = _minutes.toString().split("").toList();
        if (_minutes > 9) {
          _tim[0] = minutesString[0];
          _tim[1] = minutesString[1];
        } else {
          _tim[0] = "0";
          _tim[1] = minutesString[0];
        }
      } else {
        _minutes = 0;
        _tim[0] = "0";
        _tim[1] = "0";
      }
    });

    _secondsTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_minutes > 0 || _seconds > 0) {
        if (_seconds > 0) {
          if (_minutes == 25) {
            _minutes = _minutes - 1;
            _tim[0] = "2";
            _tim[1] = "4";
          }
          _seconds = _seconds - 1;
          List<String> secondsString = _seconds.toString().split("").toList();

          if (_seconds > 9) {
            _tim[2] = secondsString[0];
            _tim[3] = secondsString[1];
          } else {
            _tim[2] = "0";
            _tim[3] = secondsString[0];
          }
        } else if (_seconds == 0) {
          _seconds = 59;
          _tim[2] = "5";
          _tim[3] = "9";
        }
      } else if (_minutes == 0 && _seconds == 0) {
        complete();
        _minutesTimer.cancel();
        _secondsTimer.cancel();
        _dotTimer.cancel();
        _dot = true;
        _tim = ["2", "5", "0", "0"];
        _minutes = 25;
        _seconds = 00;
        _started = false;
        _playerTime.dispose();
      }
    });
  }

  complete() async {
    final player = AudioPlayer();
    await player.setAsset("lib/Assets/Audio/done.wav");
    await player.play();
    await player.dispose();
  }

  start() async {
    final player = AudioPlayer();
    await player.setAsset("lib/Assets/Audio/startTimer.mp3");
    player.setVolume(0.5);
    await player.play();
    await player.dispose();
  }

  sceneChanger() {
    final len = _backgrounds.length;
    if (!_sceneEnabled) {
      setState(() {
        _backIndex = 0;
        _sceneEnabled = true;
      });
    } else {
      if (_backIndex == len - 1) {
        setState(() {
          _sceneEnabled = false;
          _backIndex = len;
        });
      } else {
        setState(() {
          _backIndex++;
        });
      }
    }
  }
}
