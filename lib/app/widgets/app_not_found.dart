import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_color.dart';

class AppNotFound extends StatelessWidget {
  const AppNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
      ),
      body: SizedBox.expand(
        child: InkWell(
          onTap: () {
            context.replace("/");
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.running_with_errors_rounded,
                size: size.width / 5,
                color: orangeColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "404",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: orangeColor,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Ketuk Untuk Halaman Utama",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.grey,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
