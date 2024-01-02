import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/services/service_url_web/service_url_web.dart';
import '../../theme/app_color.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            "About Mobile App (Unofficially App)",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: orangeColor,
                ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Honestly, I was just bored at first, lol. I'm a mobile app and designer who needed some reference for my designs, so I found this website called CHAMJO. It was very helpful for me to find design ideas for mobile apps. After I looked around for a bit, I found out that CHAMJO also published its API. I read the documentation and then started working on my mobile app so I could check it out without having to open my browser again.",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  height: 1.5,
                ),
          ),
          ListTile(
            onTap: () {
              ServiceUrlWeb.launchURL("https://github.com/baydim");
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Find me on github",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: orangeColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              Icons.open_in_new_rounded,
              color: orangeColor,
              size: 20,
            ),
            dense: true,
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 0,
            color: orangeColor,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "About Chamjo Website (Officially)",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: orangeColor,
                ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              ServiceUrlWeb.launchURL(
                  "https://tulip-heaven-489.notion.site/About-us-9ad473de875b47bbbdeeb5fb6f55e941");
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Introduction",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: orangeColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              Icons.open_in_new_rounded,
              color: orangeColor,
              size: 20,
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {
              ServiceUrlWeb.launchURL(
                  "https://tulip-heaven-489.notion.site/Say-hello-to-Champions-9c057e9bf835424c859bf27733e6362f");
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Contributor",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: orangeColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              Icons.open_in_new_rounded,
              color: orangeColor,
              size: 20,
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {
              ServiceUrlWeb.launchURL(
                  "https://tulip-heaven-489.notion.site/2022-3-What-s-up-Chamjo-f17e95f5729843f2a1a83cac833caccc");
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Change Log",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: orangeColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              Icons.open_in_new_rounded,
              color: orangeColor,
              size: 20,
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {
              ServiceUrlWeb.launchURL(
                  "https://tulip-heaven-489.notion.site/Chamjo-Terms-and-Conditions-3fd51a28fa4144ed939b6eaa72aeb197");
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              "T&Cs",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: orangeColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              Icons.open_in_new_rounded,
              color: orangeColor,
              size: 20,
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {
              ServiceUrlWeb.launchURL(
                  "https://tulip-heaven-489.notion.site/Chamjo-Privacy-Policies-a019198a19d441fe9cc069dc223c9dc9");
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Privacy Policies",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: orangeColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              Icons.open_in_new_rounded,
              color: orangeColor,
              size: 20,
            ),
            dense: true,
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 0,
            color: orangeColor,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              ServiceUrlWeb.launchURL("https://linktr.ee/supportchamjo");
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Buy us a coffe ",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: orangeColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              Icons.open_in_new_rounded,
              color: orangeColor,
              size: 20,
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {
              ServiceUrlWeb.launchURL("https://linktr.ee/chamjodesign");
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Follow us",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: orangeColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              Icons.open_in_new_rounded,
              color: orangeColor,
              size: 20,
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {
              ServiceUrlWeb.launchURL(
                  "https://docs.google.com/forms/d/e/1FAIpQLScZ1jWeUGO8ChIjrQnaRtESDElSwOFRNZuKg6yWQk7_1a3ydg/viewform");
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Request",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: orangeColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              Icons.open_in_new_rounded,
              color: orangeColor,
              size: 20,
            ),
            dense: true,
          ),
          ListTile(
            onTap: () {
              ServiceUrlWeb.launchURL("https://t.me/designfellowid");
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Join Community",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: orangeColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              Icons.open_in_new_rounded,
              color: orangeColor,
              size: 20,
            ),
            dense: true,
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 0,
            color: orangeColor,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              ServiceUrlWeb.launchURL("https://chamjo.design/");
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Web Chamjo Design",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: orangeColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              Icons.open_in_new_rounded,
              color: orangeColor,
              size: 20,
            ),
            dense: true,
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          // const Divider(
          //   height: 0,
          //   color: orangeColor,
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ListTile(
          //   onTap: () {
          //     // ServiceNotification.debugShowNotif();
          //   },
          //   contentPadding: EdgeInsets.zero,
          //   title: Text(
          //     "Test Notif",
          //     style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //           fontWeight: FontWeight.bold,
          //           color: orangeColor,
          //         ),
          //     overflow: TextOverflow.ellipsis,
          //   ),
          //   trailing: const Icon(
          //     Icons.open_in_new_rounded,
          //     color: orangeColor,
          //     size: 20,
          //   ),
          //   dense: true,
          // ),
        ],
      ),
    );
  }
}
