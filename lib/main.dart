import 'package:chapter7and8/pages/gratitude.dart';
// import 'package:chapter7and8/widgets/animated_balloon.dart';
import 'package:chapter7and8/widgets/animated_balloon2.dart';
// import 'package:chapter7and8/widgets/animated_container.dart';
// import 'package:chapter7and8/widgets/animated_cross_fade.dart';
// import 'package:chapter7and8/widgets/animated_opacity.dart';
import 'package:flutter/material.dart';
import 'package:chapter7and8/pages/about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      title: "Animation",
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _howAreYou = "How are you ...";
  void _openPageAbout(
      {required BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => const About(),
      ),
    );
  }

  void _openPageGratitude(
      {required BuildContext context, bool fullscreenDialog = false}) async {
    final String _gratitudeResponse = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => Gratitude(
          radioGroupValue: -1,
        ),
      ),
    );
    _howAreYou = _gratitudeResponse ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              onPressed: () => _openPageAbout(
                    context: context,
                    fullscreenDialog: true,
                  ),
              icon: const Icon(Icons.info_outline))
        ],
      ),
      // body: SafeArea(
      //     child: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Text(
      //     'Grateful for: $_howAreYou',
      //     style: const TextStyle(fontSize: 32.0),
      //   ),
      // )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageGratitude(context: context),
        tooltip: 'About',
        child: const Icon(Icons.sentiment_satisfied),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const <Widget>[
              // AnimatedBallonWidget(),
              AnimatedBalloon2Widget()
            ],
          ),
          ),
        ),
      )
    );
  }
}



// SafeArea(
//           child: Column(
//         children: const <Widget>[
//           AnimatedContainerWidget(),
//           Divider(),
//           AnimatedCrossFadeWidget(),
//           Divider(),
//           AnimatedOpacityWidget(),
//           Divider(),
         
//         ],
//       )),