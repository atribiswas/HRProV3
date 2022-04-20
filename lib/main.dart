import 'dart:html';

import 'package:flutter/material.dart';
import 'sound_recorder.dart';
import 'package:avatar_glow/avatar_glow.dart';

void main() {
  runApp(MyApp());
}

bool fubar(bool x) {
  if (x == true) {
    return false;
  } else {
    return true;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.white),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final recorder = SoundRecorder();
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  bool loveState = false;
  var recno = 0;
  bool showWidget = true;
  // final recorder = SoundRecorder();
  //@override
  //void initState() {
  //   super.initState();
  //  recorder.init();
  //}

  // @override
  // void dispose() {
  //   recorder.dispose();
  //   super.dispose();
  // }
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build2() {
    // Widget buildStart2(){
    return CircularProgressIndicator(
      value: controller.value,
      semanticsLabel: 'Linear progress indicator',
    );
  }

  Widget build(BuildContext context) {
    //recorder.init();
    Widget buildStart() {
      final isRecording = loveState;
      final icon = isRecording ? Icons.stop : Icons.mic;
      final text = isRecording ? 'Stop' : 'Start';
      final primary = isRecording ? Colors.red : Colors.white;
      final onPrimary = isRecording ? Colors.white : Colors.black;
      final avglow = isRecording ? true : false;
      return AvatarGlow(
          glowColor: Colors.redAccent,
          animate: avglow,
          endRadius: 60.0,
          child: FloatingActionButton.extended(
            backgroundColor: primary,
            foregroundColor: onPrimary,
            icon: Icon(icon),
            label: Text(
              text,
            ),
            onPressed: () async {
              //final isRecording = await recorder.toggleRecording();
              if (recno == 0) {
                recno++;
                loveState = fubar(loveState);
                setState(() {});
              } else {
                showWidget = false;
                setState(() {});
              }
            },
          ));
    }

    return Scaffold(
        appBar: AppBar(
            leading: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Image.asset("images/logo_lightmode.png",
                    height: 200, width: 200)),
            title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications),
                      color: Colors.blueAccent,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share),
                      color: Colors.blueAccent,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      color: Colors.blueAccent,
                    )
                  ],
                ))),
        body: Center(
          child: AnimatedOpacity(
            duration: Duration(seconds: 3),
            opacity: 1.0,
            child: AnimatedContainer(
              alignment: Alignment.center,
              child: showWidget ? buildStart() : build2(),
              duration: Duration(seconds: 2),
              curve: Curves.bounceOut,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyResultPage(
                      title: 'My Results',
                    )),
          );
        }));
  }
}

class MyResultPage extends StatefulWidget {
  MyResultPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyResultPageState createState() => _MyResultPageState();
}

class _MyResultPageState extends State<MyHomePage> {
  Widget build3() {
    bool ali = true;
    bool w = true;
    bool h = true;
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      alignment: ali ? Alignment.bottomCenter : Alignment.center,
      width: w ? 100 : 300,
      height: h ? 100 : 600,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: Image.asset("images/logo_lightmode.png",
                  height: 200, width: 200)),
          title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications),
                    color: Colors.blueAccent,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share),
                    color: Colors.blueAccent,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    color: Colors.blueAccent,
                  )
                ],
              ))),
      body: Center(child: build3()),
    );
  }
}
