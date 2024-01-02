import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../data/repsitories/repos_chamjo.dart';
import '../../data/services/service_url_web/service_url_web.dart';
import '../../models/response/respnse_data_design_detail.dart';
import '../../theme/app_color.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_image_network.dart';
import '../../widgets/app_page_error.dart';
import '../../widgets/app_page_load.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import 'detail_frame.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.id});
  final String id;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  // Get detail
  bool isLoad = true;
  ResponseDataDesignDetail dataDetail = ResponseDataDesignDetail(
    status: false,
  );
  Color dark = orangeColor;
  funcGetDetail() async {
    isLoad = true;
    setState(() {});
    dataDetail = await RepsChamjo.getDetail(widget.id);

    if (dataDetail.status == true && (dataDetail.data?.isNotEmpty == true)) {
      dark = Color(
        CorePalette.of(HexColor.fromHex(
          dataDetail.data?[0].newColor ?? "fff",
        ).value)
            .primary
            .get(50),
      );
    }

    isLoad = false;
    setState(() {});
  }

  @override
  void initState() {
    funcGetDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: isLoad
          ? Colors.white
          : dataDetail.data == null ||
                  (dataDetail.data?.isEmpty ?? true) == true
              ? Colors.white
              : HexColor.fromHex(dataDetail.data?[0].newColor ?? "fff"),
      // backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: dark,
        ),
        elevation: 0,
        backgroundColor: isLoad
            ? Colors.white
            : dataDetail.data == null ||
                    (dataDetail.data?.isEmpty ?? true) == true
                ? Colors.white
                : HexColor.fromHex(dataDetail.data?[0].newColor ?? "fff"),
        centerTitle: true,
        title: SvgPicture.asset(
          "assets/chamjo.svg",
          colorFilter: ColorFilter.mode(
            dark,
            BlendMode.srcIn,
          ),
          theme: SvgTheme(
            currentColor: dark,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Clipboard.setData(
                ClipboardData(
                  text: "https://chamjo.design/details/${widget.id}",
                ),
              ).then((value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: dark,
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
              color: dark,
            ),
          ),
        ],
      ),
      body: isLoad
          ? const AppPageLoad()
          : dataDetail.status == null || dataDetail.status == false
              ? AppPageError(
                  message: dataDetail.message!,
                  onTap: () {
                    funcGetDetail();
                  },
                )
              : ((dataDetail.data?.isEmpty ?? true) == true)
                  ? AppPageError(
                      message: "Desain Tida Ada",
                      onTap: () {
                        context.pop();
                      },
                    )
                  : Theme(
                      data: appTheme.copyWith(
                        highlightColor: dark,
                        hintColor: dark,
                      ),
                      child: Scrollbar(
                        interactive: true,
                        thickness: 6,
                        radius: const Radius.circular(20),
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                color: HexColor.fromHex(
                                    dataDetail.data?[0].newColor ?? "fff"),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: size.width / 5,
                                      decoration: BoxDecoration(
                                          color: dataDetail.data?[0].newColor !=
                                                  null
                                              ? HexColor.fromHex(dataDetail
                                                      .data?[0].newColor ??
                                                  "fff")
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 5),
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              color: Colors.black26,
                                            ),
                                          ]),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: AppImageNetworkUseAnimBlur(
                                          addTapDetail: true,
                                          src: dataDetail
                                              .data?[0].imageUrl?[0].icon,
                                          fit: BoxFit.contain,
                                          color: HexColor.fromHex(
                                              dataDetail.data?[0].newColor ??
                                                  "fff"),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      dataDetail.data?[0].name ?? "--",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: dark,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 2.5,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          for (var i
                                              in dataDetail.data?[0].category ??
                                                  <String>[])
                                            TextSpan(text: "$i, "),
                                          TextSpan(
                                              text: dataDetail.data?[0].type),
                                        ],
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: dark.withOpacity(0.8),
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text: dataDetail
                                                      .data?[0].provider ??
                                                  ""),
                                          const TextSpan(text: ", "),
                                          TextSpan(
                                              text: dataDetail
                                                      .data?[0].copyright ??
                                                  ""),
                                        ],
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Country ${dataDetail.data?[0].country ?? ""}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: dark.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 9,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Contributor",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        color: dark,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: AspectRatio(
                                                        aspectRatio: 1,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: dark,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              (dataDetail
                                                                          .data?[
                                                                              0]
                                                                          .contributor ??
                                                                      "Anonim")
                                                                  .split("")
                                                                  .first,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge
                                                                  ?.copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      flex: 10,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            dataDetail.data?[0]
                                                                    .contributor ??
                                                                "Anonim",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge
                                                                ?.copyWith(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .verified_rounded,
                                                            color: Colors
                                                                .blueAccent,
                                                            size: 15,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                1000,
                                              ),
                                              child: Material(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1000), // Set the radius to half the width/height
                                                ),
                                                color: Colors.transparent,
                                                child: AspectRatio(
                                                  aspectRatio: 1,
                                                  child: InkWell(
                                                    radius: 1000,
                                                    highlightColor:
                                                        dark.withOpacity(0.3),
                                                    onTap: () {
                                                      ServiceUrlWeb.launchURL(
                                                        "https://tulip-heaven-489.notion.site/Became-Champions-4fee74579d074a14a97ecc2d1007eda5",
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      size: 20,
                                                      color: dark,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Avaliable on",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: dark,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Container(
                                      width: size.width,
                                      color: Colors.transparent,
                                      child: Row(
                                        children: [
                                          if ((dataDetail.data?[0].playstore
                                                      ?.isEmpty ??
                                                  true) !=
                                              true) ...[
                                            const SizedBox(
                                              width: 2.5,
                                            ),
                                            Expanded(
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                    dark,
                                                  ),
                                                ),
                                                // icon: const Icon(
                                                //     Icons.link_rounded),
                                                onPressed: () {
                                                  ServiceUrlWeb.launchURL(
                                                      dataDetail.data?[0]
                                                              .playstore ??
                                                          "-");
                                                },
                                                child: const Text("Play Store"),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2.5,
                                            ),
                                          ],
                                          if ((dataDetail.data?[0].appstore
                                                      ?.isEmpty ??
                                                  true) !=
                                              true) ...[
                                            const SizedBox(
                                              width: 2.5,
                                            ),
                                            Expanded(
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                    dark,
                                                  ),
                                                ),
                                                // icon: const Icon(
                                                //     Icons.link_rounded),
                                                onPressed: () {
                                                  ServiceUrlWeb.launchURL(
                                                      dataDetail.data?[0]
                                                              .appstore ??
                                                          "-");
                                                },
                                                child: const Text("App Store"),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2.5,
                                            ),
                                          ],
                                          if ((dataDetail
                                                      .data?[0].web?.isEmpty ??
                                                  true) !=
                                              true) ...[
                                            const SizedBox(
                                              width: 2.5,
                                            ),
                                            Expanded(
                                              child: ElevatedButton.icon(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                    dark,
                                                  ),
                                                ),
                                                icon: const Icon(
                                                    Icons.link_rounded),
                                                onPressed: () {
                                                  ServiceUrlWeb.launchURL(
                                                      dataDetail.data?[0].web ??
                                                          "-");
                                                },
                                                label: const Text("Web"),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2.5,
                                            ),
                                          ]
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SliverPadding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              sliver: SliverGrid.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 9 / 20,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                // Tentukan jumlah item berdasarkan data Anda
                                itemCount: dataDetail.data?[0].imageUrl?[2]
                                        .pattern?.length ??
                                    0,
                                itemBuilder: (BuildContext context, int index) {
                                  var data = dataDetail
                                      .data![0].imageUrl![2].pattern![index];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: dark.withOpacity(0.1),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 10,
                                            left: 15,
                                            right: 20,
                                            bottom: 20,
                                            child: SvgPicture.asset(
                                              "assets/chamjo.svg",
                                              colorFilter: ColorFilter.mode(
                                                dark.withOpacity(
                                                  0.1,
                                                ),
                                                BlendMode.srcIn,
                                              ),
                                              theme: SvgTheme(
                                                currentColor: dark.withOpacity(
                                                  0.1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailFrame(
                                                    imageUrl: data.name,
                                                    color: HexColor.fromHex(
                                                        dataDetail.data?[0]
                                                                .newColor ??
                                                            "fff"),
                                                    title: "Detail Design",
                                                  ),
                                                ),
                                              );
                                            },
                                            child: AppImageNetworkUseAnimBlur(
                                              addTapDetail: false,
                                              fit: BoxFit.cover,
                                              src: data.name,
                                              color: HexColor.fromHex(dataDetail
                                                      .data?[0].newColor ??
                                                  "fff"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
    );
  }
}

// adb shell 'am start -a android.intent.action.VIEW \
//     -c android.intent.category.BROWSABLE \
//     -d "https://chamjo.design/details/hjhjhjjh"' \
//     <com.example.chamjo_design_mobile>
