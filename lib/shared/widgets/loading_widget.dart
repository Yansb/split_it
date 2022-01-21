import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  final Size size;
  const LoadingWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Shimmer.fromColors(
        child: Container(color: Colors.white),
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.white30,
      ),
    );
  }
}
