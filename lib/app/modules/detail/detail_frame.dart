import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import '../../theme/app_color.dart';
// import 'package:photo_view/photo_view.dart';

class DetailFrame extends StatefulWidget {
  const DetailFrame(
      {super.key, required this.imageUrl, this.title, this.color});
  final String? imageUrl;
  final String? title;
  final Color? color;

  @override
  State<DetailFrame> createState() => _DetailFrameState();
}

class _DetailFrameState extends State<DetailFrame> {
  bool showFrame = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color ?? orangeColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Clipboard.setData(
                ClipboardData(
                  text: widget.imageUrl ?? "DATA TIDAK ADA",
                ),
              ).then((value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Color(
                      CorePalette.of((widget.color ?? orangeColor).value)
                          .primary
                          .get(50),
                    ),
                    margin: const EdgeInsets.all(20),
                    content: Text(
                      'Berhasil menyalin url',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              });
            },
            icon: Icon(
              Icons.link_rounded,
              color: Color(
                CorePalette.of((widget.color ?? orangeColor).value)
                    .primary
                    .get(50),
              ),
            ),
          ),
        ],
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(
            CorePalette.of((widget.color ?? orangeColor).value).primary.get(50),
          ),
        ),
        title: SvgPicture.asset(
          "assets/chamjo.svg",
          colorFilter: ColorFilter.mode(
            Color(
              CorePalette.of((widget.color ?? orangeColor).value)
                  .primary
                  .get(50),
            ),
            BlendMode.srcIn,
          ),
          theme: SvgTheme(
            currentColor: Color(
              CorePalette.of((widget.color ?? orangeColor).value)
                  .primary
                  .get(50),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: widget.color ?? orangeColor,
      ),
      body: InteractiveViewer(
        maxScale: 100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, kToolbarHeight),
            child: Container(
              decoration: showFrame
                  ? BoxDecoration(
                      border: const Border.symmetric(
                        vertical: BorderSide(
                          width: 10,
                        ),
                        horizontal: BorderSide(
                          width: 30,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    )
                  : null,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: FadeInImage.assetNetwork(
                  image: widget.imageUrl!,
                  fit: BoxFit.contain,
                  fadeInDuration: const Duration(
                    seconds: 1,
                  ),
                  placeholder: "assets/peace.png",
                ),
              ),
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.small(
        backgroundColor: darken(widget.color!),
        onPressed: () {
          setState(() {
            showFrame = !showFrame;
          });
        },
        child: Icon(
          !showFrame ? Icons.mobile_off_rounded : Icons.mobile_friendly_rounded,
        ),
      ),

      //  SizedBox.expand(
      //   child: InteractiveViewer(
      //     onInteractionEnd: (details) {},
      //     onInteractionStart: (details) {},
      //     onInteractionUpdate: (details) {},
      //     maxScale: 100.0,
      //     child: Padding(
      //       padding: const EdgeInsets.all(20),
      //       child: FadeInImage.assetNetwork(
      //         image: widget.imageUrl!,
      //         fit: BoxFit.contain,
      //         fadeInDuration: const Duration(
      //           seconds: 1,
      //         ),
      //         placeholder: "assets/peace.png",
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
