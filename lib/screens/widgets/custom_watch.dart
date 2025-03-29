
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_billon/api/api.dart';
import 'package:one_billon/models/sports_training_model.dart';
import 'package:one_billon/screens/enjoy/selected_video.dart';
import 'package:one_billon/shared/helper/helper.dart';
import 'package:shimmer/shimmer.dart';

class CustomWatch extends StatefulWidget {
  CustomWatch({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomWatch> createState() => _CustomWatchState();
}

class _CustomWatchState extends State<CustomWatch> {
  List<SportsTrainingModel> loadedTrainingVideos = [];

  bool isLoading = true;
  @override
  void didChangeDependencies() {
    FireBaseApi(context).getTrainingVideos().then((value) {
      loadedTrainingVideos.clear();
      loadedTrainingVideos.addAll(value);
      isLoading = false;

      log("Done");

      setState(() {});
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        shrinkWrap: true,
        reverse: true,
        itemCount: loadedTrainingVideos.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              navigateWithFade(context,
                  SelectedVideo(selectedVideo: loadedTrainingVideos[index]));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // The image widget
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachAndShimmer(
                        width: 140,
                        height: 200,
                        imagePath: loadedTrainingVideos[index].image,
                      ),
                    ),

                    // Center the video icon over the image
                    Center(
                      child: Icon(
                        Icons.play_circle_filled,
                        size: 40,
                        color: Colors.white
                            .withOpacity(0.8), // Semi-transparent white
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



class CachAndShimmer extends StatelessWidget {
  const CachAndShimmer({
    super.key,
    required this.width,
    required this.height,
    required this.imagePath,
  });

  final String? imagePath;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath ?? '',
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: width,
          height: height,
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.broken_image,
        size: 50,
        color: Colors.grey,
      ),
    );
  }
}

