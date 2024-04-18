import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

import 'camera.dart';
import 'bndbox.dart';
import 'models.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const HomePage(this.cameras, {super.key});

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  late List<dynamic> _recognitions = [];
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  @override
  void initState() {
    super.initState();
  }

  loadModel() async {
    String? res;
    switch (_model) {
      case posenet:
        res = await Tflite.loadModel(
          model: "assets/posenet_mv1_075_float_from_checkpoints.tflite",
        );
        break;
    }
    if (kDebugMode) {
      print(res);
    }
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: _model == ""
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(posenet),
              onPressed: () => onSelect(posenet),
            ),
          ],
        ),
      )
          : Stack(
        children: [
          Camera(
            widget.cameras,
            _model,
            setRecognitions,
          ),
          BndBox(
            _recognitions,
            math.max(_imageHeight, _imageWidth),
            math.min(_imageHeight, _imageWidth),
            screen.height,
            screen.width,
            _model,
          ),
        ],
      ),
    );
  }
}









// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:tflite/tflite.dart';
// import 'dart:math' as math;
//
// import 'camera.dart';
// import 'bndbox.dart';
// import 'models.dart';
//
// class HomePage extends StatefulWidget {
//   final List<CameraDescription> cameras;
//
//   const HomePage(this.cameras, {super.key});
//
//   @override
//   _HomePageState createState() {
//     return _HomePageState();
//   } // Change the return type
// }
//
//
// class _HomePageState extends State<HomePage> {
//   late List<dynamic> _recognitions = [];
//   int _imageHeight = 0;
//   int _imageWidth = 0;
//   String _model = "";
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   loadModel() async {
//     String? res;
//     switch (_model) {
//
//       case posenet:
//         res = await Tflite.loadModel(
//             model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
//         break;
//     }
//     if (kDebugMode) {
//       print(res);
//     }
//   }
//
//   onSelect(model) {
//     setState(() {
//       _model = model;
//     });
//     loadModel();
//   }
//
//   setRecognitions(recognitions, imageHeight, imageWidth) {
//     setState(() {
//       _recognitions = recognitions;
//       _imageHeight = imageHeight;
//       _imageWidth = imageWidth;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size screen = MediaQuery.of(context).size;
//     return Scaffold(
//       body: _model == ""
//           ? Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: const Text(posenet),
//               onPressed: () => onSelect(posenet),
//             ),
//           ],
//         ),
//       )
//           : Stack(
//         children: [
//           Camera(
//             widget.cameras,
//             _model,
//             setRecognitions,
//           ),
//           BndBox(
//               _recognitions,
//               math.max(_imageHeight, _imageWidth),
//               math.min(_imageHeight, _imageWidth),
//               screen.height,
//               screen.width,
//               _model),
//         ],
//       ),
//     );
//   }
// }