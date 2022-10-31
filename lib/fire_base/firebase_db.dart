import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class FireStoreDataBase {
  List studentsList = [];
  final CollectionReference collectionRef =
  FirebaseFirestore.instance.collection("Project App Store");

  Future getData() async {
    try {
      //to get data from a single/particular document alone.
      // var temp = await collectionRef.doc("Eop4Vq7nGXe4Rg4M0Sa4").get();

      // to get data from all documents sequentially
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          studentsList.add(result.data());
        }
      });

      return studentsList;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> ClickAppDetails(Map<String, dynamic> appDetail) async {
    Map<String, dynamic> dDetail = await deviceInfo();

    final Map<String, dynamic> thirdMap = {
      ...appDetail,
      ...dDetail,
    };

    try {
      return FirebaseFirestore.instance
          .collection("Project App Store")
          .add(thirdMap)
          .then((value) => debugPrint("User Added"))
          .catchError((error) => debugPrint("Failed to add user: $error"));

      ;
    } catch (e) {}
    //creates a new doc with unique doc ID
  }

  Future<void> socialMedia(Map<String, dynamic> appDetail) async {
    Map<String, dynamic> dDetail = await deviceInfo();

    final Map<String, dynamic> thirdMap = {
      ...appDetail,
      ...dDetail,
    };

    try {
      return FirebaseFirestore.instance
          .collection("Social Media")
          .add(thirdMap)
          .then((value) => debugPrint("User Added"))
          .catchError((error) => debugPrint("Failed to add user: $error"));

      ;
    } catch (e) {}
    //creates a new doc with unique doc ID
  }
  Future<void> downLoadCV() async {
    Map<String, dynamic> dDetail = await deviceInfo();

    final Map<String, dynamic> thirdMap = {
      ...{
        'createdOn': FieldValue.serverTimestamp()
      },
      ...dDetail,
    };

    try {
      return FirebaseFirestore.instance
          .collection("DownLoad CV")
          .add(thirdMap)
          .then((value) => debugPrint("User Added"))
          .catchError((error) => debugPrint("Failed to add user: $error"));

      ;
    } catch (e) {}
    //creates a new doc with unique doc ID
  }

  Future<void> ClickExploreNow() async {
    Map<String, dynamic> dDetail = await deviceInfo();

    final Map<String, dynamic> thirdMap = {
      ...{'createdOn': FieldValue.serverTimestamp()},
      ...dDetail,
    };

    try {
      return FirebaseFirestore.instance
          .collection("Explore Now")
          .add(thirdMap)
          .then((value) => debugPrint("User Added"))
          .catchError((error) => debugPrint("Failed to add user: $error"));

      ;
    } catch (e) {}
    //creates a new doc with unique doc ID
  }

  Future<void> addField() {
    return collectionRef
        .doc('MyDoc')
    //will edit the doc if already available or will create a new doc with this given ID
        .set(
      {'role': "developer"},
      SetOptions(merge: true),
      // if set to 'false', then only these given fields will be added to that doc
    )
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  printDocID() async {
    var querySnapshots = await collectionRef.get();
    for (var snapshot in querySnapshots.docs) {
      var documentID = snapshot.id;
      debugPrint("documentID");
      debugPrint(documentID);
    }
  }

  Future<Map<String, dynamic>> deviceInfo() async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.deviceInfo;

      return {
        "browserName": deviceInfo.data["browserName"].toString(),
        "appCodeName": deviceInfo.data["appCodeName"],
        "appName": deviceInfo.data["appName"],
        "appVersion": deviceInfo.data["appVersion"],
        "deviceMemory": deviceInfo.data["deviceMemory"],
        "language": deviceInfo.data["language"],
        "platform": deviceInfo.data["platform"],
        "userAgent": deviceInfo.data["userAgent"],
        "vendor": deviceInfo.data["vendor"],
        "hardwareConcurrency": deviceInfo.data["hardwareConcurrency"]
      };
    } catch (e) {
      return {};
    }
  }
}