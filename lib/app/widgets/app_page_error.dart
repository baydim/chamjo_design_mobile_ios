import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class AppPageError extends StatelessWidget {
  const AppPageError({super.key, this.message, required this.onTap});
  final String? message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox.expand(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
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
                message ?? "Terjadi Kesalahan",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: orangeColor,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Ketuk Untuk Memuat Ulang",
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
