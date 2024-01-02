import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/response/respnse_data_design.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/app_image_network.dart';

class CardHome extends StatefulWidget {
  const CardHome({super.key, required this.data});
  final DataDesign data;

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        InkWell(
          onTap: () {
            context.go("/details/${widget.data.id}");
          },
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              builder: (ctx) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: IntrinsicHeight(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        alignment: Alignment.bottomCenter,
                        transformAlignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: widget.data.newColor != null
                                      ? HexColor.fromHex(
                                          widget.data.newColor ?? "fff")
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 5),
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      color: Colors.black26,
                                    ),
                                  ]),
                              width: size.width / 7,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: AppImageNetworkUseAnimBlur(
                                    addTapDetail: false,
                                    src: widget.data.imageUrl?[0].icon,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.data.name ?? "--",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 2.5,
                                ),
                                Text(
                                  widget.data.type ?? "--",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AppImageNetworkUseAnimBlur(
                              addTapDetail: false,
                              src: widget.data.imageUrl?[1].card,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              barrierColor: widget.data.newColor != null
                  ? HexColor.fromHex(widget.data.newColor ?? "fff")
                      .withOpacity(0.5)
                  : null,
            );
          },
          child: Container(
            width: size.width,
            height: size.width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.data.newColor != null
                  ? HexColor.fromHex(widget.data.newColor ?? "fff")
                  : Colors.white,
            ),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: widget.data.newColor != null
                                      ? HexColor.fromHex(
                                          widget.data.newColor ?? "fff")
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 5),
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      color: Colors.black26,
                                    ),
                                  ]),
                              width: size.width / 7,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: AppImageNetworkUseAnimBlur(
                                    addTapDetail: false,
                                    src: widget.data.imageUrl?[0].icon,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.data.name ?? "--",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 2.5,
                            ),
                            Text(
                              widget.data.type ?? "--",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        transformAlignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color: widget.data.newColor != null
                              ? HexColor.fromHex(widget.data.newColor ?? "fff")
                              : Colors.white,
                        ),
                        child: AppImageNetworkUseAnimBlur(
                          addTapDetail: false,
                          src: widget.data.imageUrl?[1].card,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                if (widget.data.DataDesignNew == true)
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                        color: const Color.fromRGBO(117, 67, 223, 0.08),
                      ),
                      child: Text(
                        "NEW",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                              color: const Color.fromRGBO(117, 67, 223, 1),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
