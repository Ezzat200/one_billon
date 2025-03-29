
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:one_billon/models/sports_training_model.dart';
import 'package:one_billon/screens/enjoy/video_player_item_training.dart';
import 'package:one_billon/screens/widgets/my_arrow_back.dart';

class SelectedVideo extends StatefulWidget {
  final SportsTrainingModel selectedVideo;

  const SelectedVideo({super.key, required this.selectedVideo});
  @override
  _VideoScreenTrainingState createState() => _VideoScreenTrainingState();
}

class _VideoScreenTrainingState extends State<SelectedVideo> {
  // List<SportsTrainingModel> loadedTrainingVideos = [];

  // bool isLoading = true;
  @override
  void didChangeDependencies() {
    // FireBaseApi(context).getTrainingVideos().then((value) {
    //   loadedTrainingVideos.clear();
    //   loadedTrainingVideos.addAll(value);
    //   isLoading = false;

    log("Video ${widget.selectedVideo.url}");

      setState(() {});
    // });

    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
           TextDirection.ltr,
      child: Scaffold(
          body: Stack(
        children: [
        PageView.builder(
                itemCount: 1,
                controller:
                    PageController(initialPage: 0, viewportFraction: 1),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      VideoPlayerItemTraining(
                          widget.selectedVideo.url!),
                      Column(
                        children: [
                          const SizedBox(height: 100),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors
                                              .transparent, // Transparent at top
                                          Colors.black.withOpacity(
                                              0.40), // Darker at bottom
                                          Colors.black.withOpacity(
                                              0.65), // Fully black at the bottom
                                        ],
                                      ),
                                    ),
                                    padding:
                                        const EdgeInsetsDirectional.only(
                                            start: 10, bottom: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          widget.selectedVideo.text!,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff34cc4e),
                                          ),
                                        ),
                                        SizedBox(height: 13,),
                                        widget.selectedVideo.description == 'NULL' ? 
                                        Container()
                                        :
                                        Text(
                                          widget.selectedVideo.description!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 120,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      MyArrowBack(),
                    ],
                  );
                },
              ),
          // InkWell(
          //   onTap: () {
          //     Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => TrainingVideosPage(),
          //         ));
          //   },
          //   child: Padding(
          //     padding: const EdgeInsetsDirectional.only(top: 40, start: 15),
          //     child: SearchIcon(),
          //   ),
          // ),
        ],
      )),
    );
  }
}
