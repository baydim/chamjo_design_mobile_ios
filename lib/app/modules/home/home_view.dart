import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
// import '../../data/services/service_notification/service_notification.dart';
import '../../data/repsitories/repos_chamjo.dart';
import '../../models/response/respnse_data_design.dart';
import '../../models/response/response_data_category.dart';
import '../../theme/app_color.dart';
import '../../utils/app_debouncer.dart';
import '../../widgets/app_image_network.dart';
import '../../widgets/app_page_error.dart';
import '../../widgets/app_page_load.dart';
import 'widget/card_home.dart';
import 'widget/home_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Get category
  bool isLoadCategory = true;
  ResponseDataCategory dataCategory = ResponseDataCategory();
  Category? selectedCategory = Category(
      id: "",
      name: "All",
      imageActive:
          "https://ndbqcbbgigoygotysyae.supabase.co/storage/v1/object/public/category/active/box.svg",
      imageInActive:
          "https://ndbqcbbgigoygotysyae.supabase.co/storage/v1/object/public/category/normal/box.svg");

  funcGetCategory() async {
    isLoadCategory = true;
    setState(() {});
    dataCategory = await RepsChamjo.getCategory();
    if (dataCategory.status == true) {
      dataCategory.data?.insert(
        0,
        Category(
            id: "",
            name: "All",
            imageActive:
                "https://ndbqcbbgigoygotysyae.supabase.co/storage/v1/object/public/category/active/box.svg",
            imageInActive:
                "https://ndbqcbbgigoygotysyae.supabase.co/storage/v1/object/public/category/normal/box.svg"),
      );
      selectedCategory = dataCategory.data?[0];
    }
    isLoadCategory = false;
    setState(() {});
  }

  bool isLoad = true;
  ResponseDataDesign dataDesign = ResponseDataDesign();
  funcGetDataDesign() async {
    isLoad = true;
    setState(() {});
    dataDesign = await RepsChamjo.getAll(selectedCategory?.name ?? "All");
    isLoad = false;
    setState(() {});
  }

  TextEditingController textController = TextEditingController();
  var debounce = AppDebouncer(milliseconds: 500);

  funcShowDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return const Splash();
      },
      barrierDismissible: false,
    );

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    // funcShowDialog();

    funcGetDataDesign();
    funcGetCategory();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ServiceNotification.listenActionNotif(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: dataCategory.status == true
            ? HomeDrawer(
                listDataCategory: dataCategory,
                selectedCategory: selectedCategory,
                onSelected: (v) {
                  selectedCategory = v;
                  funcGetDataDesign();
                },
              )
            : null,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: orangeColor,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SvgPicture.asset(
            "assets/chamjo.svg",
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.go("/info");
                },
                icon: const Icon(
                  Icons.info_outline_rounded,
                ))
          ],
        ),
        body: isLoad
            ? const AppPageLoad()
            : dataCategory.status == false || dataDesign.status == false
                ? AppPageError(
                    onTap: () {
                      funcGetCategory();
                      funcGetDataDesign();
                    },
                    message: dataDesign.message,
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    children: [
                      Row(
                        children: [
                          AppImageSvgNetwork(
                            src: selectedCategory?.imageActive ?? "",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            selectedCategory == null
                                ? "All"
                                : selectedCategory?.name ?? "--",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: orangeColor,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: textController,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          isCollapsed: true,
                          hintText: "Search in ${selectedCategory?.name}",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1000),
                            borderSide: const BorderSide(
                              color: orangeColor,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1000),
                            borderSide: const BorderSide(
                              color: orangeColor,
                              width: 2,
                            ),
                          ),
                        ),
                        onChanged: (v) {
                          debounce.run(() {
                            Future.microtask(() {
                              setState(() {});
                            });
                          }, "t");
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      for (var data
                          in (dataDesign.data?.data ?? <DataDesign>[]).where(
                        (element) => element.name!.toLowerCase().contains(
                              textController.text.toLowerCase(),
                            ),
                      ))
                        CardHome(data: data),
                    ],
                  ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.width / 1.2,
                  color: Colors.transparent,
                  alignment: Alignment.bottomCenter,
                  transformAlignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    "assets/hero.svg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Positioned.fill(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: kToolbarHeight,
                        ),
                        // Text(
                        //   "Backed your product with various references",
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .headlineSmall
                        //     ?.copyWith(
                        //       color: orangeColor,
                        //     ),
                        // )
                        Text.rich(
                          TextSpan(
                            text: "Backed your product with",
                            children: [
                              TextSpan(
                                text: " various ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      color: const Color.fromRGBO(
                                        117,
                                        67,
                                        223,
                                        1,
                                      ),
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              const TextSpan(text: "references")
                            ],
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: orangeColor,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            "Chamjo inspire you with amazing product from across the world",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
