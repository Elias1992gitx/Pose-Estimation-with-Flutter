# Pose Estimation Application

## Overview
the project is Pose Estimation Application developed using TensorFlow Lite, Flutter, and the PoseNet MobileNet V1 model. The application utilizes pre-trained and optimized models to identify various classes of objects, including people, activities, animals, plants, and places. Specifically, it focuses on real-time pose estimation using the PoseNet MobileNet V1 model combined with the Flutter Camera Plugin.

## Required Packages
To run the Pose Estimation Application, the following packages are required:

### TensorFlow Lite
- **tflite** | [Flutter Package](https://pub.dev/packages/tflite)
  - A Flutter plugin for accessing TensorFlow Lite API. Supports image classification, object detection (SSD and YOLO), and other machine learning tasks.

### Camera Plugin
- **camera** | [Flutter Package](https://pub.dev/packages/camera)
  - A Flutter plugin for iOS and Android that allows access to the device cameras. This plugin enables capturing the live feed provided by the mobile camera frame-by-frame, essential for real-time pose estimation.

### PoseNet MobileNet V1
- **PoseNet MobileNet V1**
  - PoseNet is a deep learning model that detects the pose of a person based on the positions of their joints. The PoseNet MobileNet V1 model takes an image as input and outputs an array of information about key points with confidence scores. These key points represent various body joints, enabling accurate pose estimation.

## Flutter Application
Now that we have set up the initial configurations, we need to install the required packages. Then we can develop our Flutter application to turn the mobile camera into a pose detector.

This project will contain three different main classes:

- **Camera:** This class contains the implementation of the camera plugin to receive the live feed.
- **BindBox:** This class contains the key points of the body with their names.
- **Home:** This class contains the error handling, loading of the model, and passing the data through the above-mentioned classes.

