import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:message2/video/video.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  static const String routePath = '/video';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideoCubit(),
      child: const VideoView(),
    );
  }
}

class VideoView extends StatelessWidget {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Vidoes'),
          ),
          body: const Center(
            child: Text('Video body page'),
          ),
        );
      },
    );
  }
}
