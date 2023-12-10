import 'dart:async';

import 'package:flutter/material.dart';

import '../model/timermodel.dart';

class CountDownTimer{
  int _mins = 0;
  int _secs = 30;
  String timesCount= "Countdown";
 double _radius = 1 ;
 bool  _isActive = true;
 late Timer timer;
 late Duration _time;
 late Duration _fullTime;

 String returnTime(Duration t){
    String minutes = (t.inMinutes<10) ? '0${t.inMinutes}':
    t.inMinutes.toString();
    int numSeconds = t.inSeconds - (t.inMinutes * 60);
    String seconds = (numSeconds < 10) ?'0$numSeconds':
    numSeconds.toString();
    String formattedTime = "$minutes:$seconds";
    return formattedTime;
 }

 Stream<TimerModel> stream() async* {
   yield* Stream.periodic(const Duration(seconds: 1), (int a) {
     String time;

     if (_isActive) {
       _time = _time - const Duration(seconds: 1);
       _radius = _time.inSeconds / _fullTime.inSeconds;

       if(_time.inSeconds <= 0 ) {
         _isActive = false;
         timesCount;
       }
     }
     time = returnTime(_time);
     return TimerModel(time: time, percent: _radius,timeUp:timesCount);
   });
 }

 void startWork() {
   _radius = 1;
   _time = Duration(minutes: _mins, seconds: _secs);
   _fullTime = _time;
 }

 void startTimer() {
   if(_time.inSeconds > 0){
     _isActive = true;
   }
 }

 void stopTimer() {
   _isActive = false;
 }



}



