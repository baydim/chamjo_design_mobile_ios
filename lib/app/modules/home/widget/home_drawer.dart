import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../models/response/response_data_category.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/app_image_network.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer(
      {super.key,
      required this.listDataCategory,
      required this.onSelected,
      this.selectedCategory});
  final ResponseDataCategory listDataCategory;
  final ValueChanged<Category> onSelected;
  final Category? selectedCategory;

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Drawer(
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: ListView.builder(
          itemCount: widget.listDataCategory.data?.length ?? 0,
          itemBuilder: (ctx, index) {
            var data = widget.listDataCategory.data?[index];
            return data == null
                ? const SizedBox.shrink()
                : ListTile(
                    dense: true,
                    selected: data.name == widget.selectedCategory?.name,
                    trailing: data.name == widget.selectedCategory?.name
                        ? const CircleAvatar(
                            radius: 2.5,
                            backgroundColor: orangeColor,
                          )
                        : null,
                    leading: SizedBox(
                      width: 24,
                      height: 24,
                      child: data.name == widget.selectedCategory?.name
                          ? AppImageSvgNetwork(
                              src: data.imageActive ?? "",
                            )
                          : AppImageSvgNetwork(
                              src: data.imageInActive ?? "",
                            ),
                    ),
                    title: Row(
                      children: [
                        Text(
                          data.name ?? "--",
                        ),
                        if (data.isNew == true) ...[
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 9,
                                    color:
                                        const Color.fromRGBO(117, 67, 223, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          )
                        ]
                      ],
                    ),
                    selectedColor: orangeColor,
                    titleTextStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                          fontWeight: data.name == widget.selectedCategory?.name
                              ? FontWeight.bold
                              : null,
                        ),
                    onTap: () {
                      widget.onSelected(data);
                      Navigator.pop(context);
                    },
                  );
          },
        ),
      ),
    );
  }
}
