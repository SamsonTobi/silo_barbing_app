import 'package:flutter/material.dart';

import '../../../../style_constants.dart';

class SkeletonListItem extends StatelessWidget {
  const SkeletonListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 18.0),
      decoration: BoxDecoration(
          color: AppColors.skeltonBg, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Skeleton(
            height: 220,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.black38,
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Skeleton(
            width: mediaQueryData.size.width * .7,
            height: 18,
          ),
          const SizedBox(
            height: 8,
          ),
          Skeleton(
            width: mediaQueryData.size.width * .4,
            height: 18,
          ),
        ],
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;

  const Skeleton({super.key, this.width, this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: AppColors.skeltonColor,
          borderRadius: BorderRadius.circular(12.0)),
      child: child,
    );
  }
}
