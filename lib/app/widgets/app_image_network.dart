import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_color.dart';
import 'app_detail_image.dart';

class AppImageNetwork extends StatelessWidget {
  const AppImageNetwork({
    super.key,
    this.src = 'https://picsum.photos/200/200',
    this.onImageTap,
    this.fit = BoxFit.cover,
  });
  final String? src;
  final ValueChanged<String>? onImageTap;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    log(src ?? "--", name: "IMAGE NETWORK");
    return src == null || src!.isEmpty
        ? Center(
            child: Icon(
              Icons.error,
              color: Colors.red.withOpacity(0.3),
            ),
          )
        : InkWell(
            onTap: () {
              onImageTap != null ? onImageTap!(src!) : () {};
            },
            child: Image.network(
              src!,
              fit: fit,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CircularProgressIndicator(color: orangeColor),
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.error,
                    color: orangeColor.withOpacity(0.3),
                  ),
                );
              },
            ),
          );
  }
}

class AppImageNetworkUseAnimBlur extends StatelessWidget {
  const AppImageNetworkUseAnimBlur(
      {super.key,
      this.src = 'https://picsum.photos/200/200',
      this.fit = BoxFit.cover,
      this.color,
      required this.addTapDetail});
  final String? src;
  final BoxFit? fit;
  final Color? color;
  final bool addTapDetail;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !addTapDetail,
      child: InkWell(
        onTap: () {
          try {
            log("HALOO");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AppDetailImage(
                  imageUrl: src,
                  color: color,
                  title: "Detail Design",
                ),
              ),
            );
          } catch (e) {
            log(e.toString());
          }
        },
        child: FadeInImage.assetNetwork(
          image: src!,
          fit: fit,
          fadeInDuration: const Duration(
            seconds: 1,
          ),
          placeholder: "assets/peace.png",
        ),
      ),
    );
  }
}

class AppImageSvgNetwork extends StatelessWidget {
  const AppImageSvgNetwork({super.key, required this.src, this.fit});
  final String src;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      src,
      semanticsLabel: 'Category',
      fit: fit ?? BoxFit.contain,
    );
  }
}
