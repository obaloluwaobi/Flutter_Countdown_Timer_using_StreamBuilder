// import 'package:flutter/material.dart';
// import 'package:numberpicker/numberpicker.dart';
//
// import '../components/timer.dart';
//
// class SettingScreen extends StatefulWidget {
//
//   const SettingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }
//
// class _SettingScreenState extends State<SettingScreen> {
//
//   final CountDownTimer timeON = CountDownTimer();
//   int  _mins = 0;
//   int _secs = 0;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       backgroundColor: Colors.black,
//       body: Column(
//         //crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 NumberPicker(
//                   minValue: 0,
//                   maxValue: 59,
//                   value: _mins,
//                   onChanged: (value){
//                     setState(() {
//                       _mins = value;
//                     });
//                   },
//                   // textStyle: const TextStyle(
//                   //   color: Colors.white,
//                   //   fontSize: 20,
//                   // ),
//                   // selectedTextStyle: const TextStyle(
//                   //     color:Colors.white,
//                   // ),
//
//                 ),
//                 const Text('Mins',style: TextStyle(fontSize: 20,color: Colors.white),),
//               ],
//             ),
//             Row(
//               children: [
//                 NumberPicker(
//                   minValue: 0,
//                   maxValue: 59,
//                   value: _secs,
//                   onChanged: (value){
//                     setState(() {
//                       _secs = value;
//                     });
//                   },
//                   // textStyle: const TextStyle(
//                   //   color: Colors.white,
//                   //   fontSize: 20,
//                   // ),
//                   // selectedTextStyle: const TextStyle(
//                   //     color:Colors.white,
//                   // ),
//
//                 ),
//                 Text('Secs',style: TextStyle(fontSize: 20,color: Colors.white),),
//               ],
//             ),
//           ],
//         ),
//         ElevatedButton(
//             onPressed: (){
//
//                Navigator.pop(context);
//
//             },
//             child: Text('Save',
//               style: TextStyle(fontSize: 25,color: Colors.white),))
//
//       ],
//
//     ),);
//
//   }
// }
