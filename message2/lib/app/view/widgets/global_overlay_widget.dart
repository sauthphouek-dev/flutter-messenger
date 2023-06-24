import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_indicator/loading_indicator.dart';

class GlobalOverlayWidget extends StatelessWidget {
  const GlobalOverlayWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: LoadingIndicator(
            indicatorType: Indicator.audioEqualizer,
          ),
        ),
      ),
      overlayOpacity: 0.35,
      overlayColor: Colors.black,
      child: Banner(
        message: 'Banner',
        location: BannerLocation.topEnd,
        color: Colors.white,
        child: child,
      ),
    );
  }
}
