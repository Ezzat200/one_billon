import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:one_billon/models/sports_training_model.dart';

class FireBaseApi {
  BuildContext context;
  FireBaseApi(this.context);

  Future<List<SportsTrainingModel>> getTrainingVideos() async {
    List<SportsTrainingModel> portsTrainingList = [];

    try {
      
      await FirebaseFirestore.instance
          .collection("enjoy")
          .orderBy('uploadTime', descending: true)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        for (int index = 0; index < querySnapshot.docs.length; index++) {
          portsTrainingList.add(SportsTrainingModel.fromJson(
              querySnapshot.docs[index].data() as Map<String, dynamic>));
        }
      });

      log("From Function");
    } catch (e) {
      print("An error occurred while getTrainingVideos ");
      print(e.toString());
    }
    print(portsTrainingList.length);
    return portsTrainingList;
  }

  
  
  }