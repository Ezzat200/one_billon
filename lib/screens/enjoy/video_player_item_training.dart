import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class VideoPlayerItemTraining extends StatefulWidget {
  final String url;
  VideoPlayerItemTraining(this.url);

  @override
  State<VideoPlayerItemTraining> createState() => _VideoPlayerItemTrainingState();
}

class _VideoPlayerItemTrainingState extends State<VideoPlayerItemTraining> {

  VideoPlayerController? _controller;
  bool showIcon=true;

  @override
  void dispose() {
    super.dispose();
    log("VideoPlayerItemTraining Disposed");
    _controller!.dispose();
  }

  @override
  void didChangeDependencies() {
    print("widgetUrl ${widget.url}");
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_)
      {
        _controller!.play();
        setState(() {});
      });

    super.didChangeDependencies();
  }
  startTimer()
  {
    Timer(Duration(seconds: 2), () async {
      setState(() {
        showIcon=false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(()
        {
          showIcon=true;
          _controller!.value.isPlaying
              ? _controller!.pause()
              : _controller!.play();
          startTimer();
        });
      },
      child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _controller!.value.isInitialized
                    ? FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    height:_controller!.value.size.height ?? 0,
                    width: _controller!.value.size.width ?? 0,
                    child: VideoPlayer(_controller!),
                  ),
                )
                    : Container(),
                VideoProgressIndicator(_controller!, allowScrubbing: true),
                showIcon?  Positioned(
                  bottom: 0,
                  left: size.width /2.1,
                  child: Icon(
                    _controller!.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 42,
                    color: Colors.grey,
                  ),
                ):SizedBox(),
              ],
            ),
          )
      ),
    );
  }
}
