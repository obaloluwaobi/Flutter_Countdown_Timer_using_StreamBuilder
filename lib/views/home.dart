import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ui_challenge/components/timer.dart';
import 'package:ui_challenge/model/timermodel.dart';
import 'package:ui_challenge/views/setting.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  bool _flag = false;
  final CountDownTimer timer = CountDownTimer();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
    duration: const Duration(milliseconds: 050));

    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.linear);

    super.initState();
  }


  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Time Verse'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(onPressed:(){
            },
              icon:const Icon(Icons.settings),color: Colors.white,),
          )
        ],

      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints
        constraints) {
          timer.startWork();
          final double availableWidth = constraints.maxWidth;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StreamBuilder(
                initialData: '00:00',
                stream: timer.stream(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  TimerModel timer = (snapshot.data == '00:00') ? TimerModel(time: '00:00', percent: 1,timeUp: '') : snapshot.data;
                    return Expanded(
                        child:CircularPercentIndicator(
                          radius: availableWidth/3,
                          lineWidth: 10,
                          percent: timer.percent,
                          progressColor: const Color(0xff009688),
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(timer.time,style: const TextStyle(fontSize: 30,color: Colors.white),),
                              Text(timer.timeUp ,style: const TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),

             ));}),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){timer.startWork();},
                        child: const Text('Restart',style: TextStyle(fontSize: 20,color: Colors.white),)),
                   GestureDetector(
                      onTap: (){

                        if (_flag == true){
                          _controller.forward();
                          timer.stopTimer();
                        }
                        else{
                          _controller.reverse();
                          timer.startTimer();
                        }
                        _flag = !_flag;

                      },
                     child: AnimatedIcon(icon: AnimatedIcons.pause_play, progress: _animation,size: 43,color: Colors.white,),),

                    TextButton(onPressed: (){
                      if(_flag == true){
                        _controller.forward();
                      }
                      else{
                       _flag = false;
                      }
                      timer.stopTimer();
                      },
                        child: const Text('Stop',style: TextStyle(fontSize: 20,color: Colors.white),)),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
