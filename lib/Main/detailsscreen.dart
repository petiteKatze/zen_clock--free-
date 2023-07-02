import "package:flutter/material.dart";
import "package:material_dialogs/widgets/buttons/icon_outline_button.dart";

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor:
          brightness == Brightness.dark ? Colors.black : Colors.white,
      body: Padding(
        padding: EdgeInsets.all(width / 20),
        child: ListView(children: [
          GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dy > 0) {
                Navigator.pop(context);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Zen Clock / Pomodoro",
                      style: TextStyle(
                          color: brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: width > 600 ? 25 : 22),
                    ),
                    Text(
                      "Made with ❤️ by Diptanshu",
                      style: TextStyle(
                        color: brightness == Brightness.dark
                            ? Colors.white.withOpacity(0.9)
                            : Colors.black54,
                      ),
                    ),
                  ],
                ),
                IconsOutlineButton(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: "Close",
                  iconData: Icons.close,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            color: brightness == Brightness.dark
                ? Colors.white.withOpacity(0.9)
                : Colors.black54,
            width: width / 3,
            height: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Why this app ?",
            style: TextStyle(
                color:
                    brightness == Brightness.dark ? Colors.white : Colors.black,
                fontSize: width > 600 ? 22 : 20),
          ),
          Text(
            "Zen Clock's aesthetically pleasing design creates a serene and calming ambiance. The live clock displays time in an elegant and minimalist manner, which can help reduce distractions and create a peaceful environment for work or study. The visually appealing interface promotes a sense of tranquility and assists in maintaining a focused mindset.",
            style: TextStyle(
              color: brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.9)
                  : Colors.black54,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "🧘‍♂️Zen Clock incorporates the Pomodoro technique, a time management method that divides work into focused intervals, typically 25 minutes long, followed by short breaks. This technique aids in combating procrastination, boosting concentration, and increasing overall productivity. By setting the Pomodoro timer within the app, you can structure your work sessions effectively, taking advantage of the power of focused bursts of activity.",
            style: TextStyle(
              color: brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.9)
                  : Colors.black54,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "✨Zen Clock provides a constant visual reminder of the passing time, allowing you to develop a better sense of time management. The live clock keeps you informed about how much time has elapsed during your work sessions and breaks. This heightened time awareness can encourage you to stay focused, avoid distractions, and make better use of your valuable time.",
            style: TextStyle(
              color: brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.9)
                  : Colors.black54,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "How to use ?",
            style: TextStyle(
                color:
                    brightness == Brightness.dark ? Colors.white : Colors.black,
                fontSize: width > 600 ? 22 : 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.swipe_left),
                Text(
                  "Swipe left from the Live Time Screen to go to the Pomodoro Screen",
                  style: TextStyle(
                      color: brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.swipe_right),
                Text(
                  "Swipe right from the Pomodoro Screen to go back to the Live Time screen",
                  style: TextStyle(
                      color: brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.multitrack_audio_sharp),
                Text(
                  "Tap on this button on any screen to play/pause the zen music",
                  style: TextStyle(
                      color: brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.play_arrow),
                Text(
                  "Use this button on Pomodoro Screen to start the Pomodoro",
                  style: TextStyle(
                      color: brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
