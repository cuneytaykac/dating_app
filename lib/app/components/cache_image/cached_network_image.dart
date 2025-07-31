import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

CachedNetworkImage cachedNetworkImage(
  String imagePath, {
  double? height,
  double? width,
  BoxFit? fit,
}) {
  return CachedNetworkImage(
    imageUrl: imagePath,
    progressIndicatorBuilder:
        (context, url, downloadProgress) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: height ?? 150,
            width: width ?? 150,
            color: Colors.white,
          ),
        ),
    imageBuilder:
        (context, imageProvider) => Container(
          width: width ?? 150,
          height: height ?? 150,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.contain,
            ),
          ),
        ),
    errorWidget:
        (context, url, error) => Assets.images.discoveryBackground.image(),
  );
}
