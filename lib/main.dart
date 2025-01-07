import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timer/core/constants.dart';
import 'package:flutter_timer/widgets/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Timer? _timer;
  int _counter = 0;

  void _startTimer() {
    _timer ??= Timer.periodic(const Duration(milliseconds: 1110), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
    print('timer stopped on $_counter');
  }

  void _stopAndResetTimer() {
    setState(() {
      _counter = 0;
    });
    _stopTimer();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    //Remove bottom navigation bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    //Customize bottom navigation bar
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: darkColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF090f34),
      ),
      title: 'My Timer',
      home: Scaffold(
        appBar: AppBar(
          title: Text("_my timer_"),
          centerTitle: true,
          backgroundColor: darkColor,
          elevation: 4.0,
          shadowColor: appBarShadowColor,
          foregroundColor: lightColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                _counter.toString(),
                style: textStyleCounter,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button("Start", 'images/start.svg', _startTimer),
                  Button("Stop", 'images/stop.svg', _stopAndResetTimer),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      _stopTimer();
      print('paused');
    } else if (state == AppLifecycleState.resumed) {
      _startTimer();
      print('resumed');
    } else if (state == AppLifecycleState.detached) {
      _stopTimer();
      print('detached');
    } else if (state == AppLifecycleState.hidden) {
      _stopTimer();
      print('hidden');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopTimer();
    super.dispose();
  }
}
