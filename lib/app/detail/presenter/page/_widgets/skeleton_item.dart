import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonItem extends StatelessWidget {
  const SkeletonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: Colors.grey.withAlpha(10),
            enabled: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.amber,
              ),
            ),
          );
        },
      ),
    );
  }
}
