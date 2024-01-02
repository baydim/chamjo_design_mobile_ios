// import 'dart:developer';
// import 'dart:isolate';
// import 'dart:math' as m;
// import 'dart:ui';

// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:chamjo_design_mobile/app/modules/detail/detail_view.dart';
// import 'package:chamjo_design_mobile/app/theme/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class ServiceNotification {
//   static initialNotif() async {
//     AwesomeNotifications().initialize(
//       // set the icon to null if you want to use the default app icon
//       'resource://drawable/ic_launcher',
//       [
//         NotificationChannel(
//           channelGroupKey: 'basic_channel_group',
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Chamjo channel for basic tests',
//           defaultColor: orangeColor,
//           ledColor: Colors.white,
//           // onlyAlertOnce: true,
//           groupAlertBehavior: GroupAlertBehavior.All,
//           // criticalAlerts: true,
//           importance: NotificationImportance.Max,
//           channelShowBadge: true,
//           defaultPrivacy: NotificationPrivacy.Public,

//           locked: false,
//         )
//       ],
//       // Channel groups are only visual and are not required
//       channelGroups: [
//         NotificationChannelGroup(
//             channelGroupKey: 'basic_channel_group',
//             channelGroupName: 'Basic group')
//       ],
//       debug: true,
//     );

//     AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//       if (!isAllowed) {
//         // This is just a basic example. For real apps, you must show some
//         // friendly dialog box before call the request method.
//         // This is very important to not harm the user experience
//         AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//   }

//   static listenActionNotif(BuildContext context) async {
//     AwesomeNotifications().setListeners(
//       onActionReceivedMethod: (ReceivedAction receivedAction) {
//         return NotificationController.onActionReceivedMethod(
//             receivedAction, context);
//       },
//       onNotificationCreatedMethod: (ReceivedNotification receivedNotification) {
//         return NotificationController.onNotificationCreatedMethod(
//             receivedNotification);
//       },
//       onNotificationDisplayedMethod:
//           (ReceivedNotification receivedNotification) {
//         return NotificationController.onNotificationDisplayedMethod(
//             receivedNotification);
//       },
//       onDismissActionReceivedMethod: (ReceivedAction receivedAction) {
//         return NotificationController.onDismissActionReceivedMethod(
//             receivedAction);
//       },
//     );
//   }

//   static debugShowNotif() {
//     var now = DateTime.now();
//     AwesomeNotifications().createNotification(
//       schedule: NotificationCalendar(
//         year: now.year,
//         month: now.month,
//         day: now.day,
//         hour: now.hour,
//         minute: now.minute + 1,
//       ),
//       content: NotificationContent(
//         id: m.Random().nextInt(1000),
//         channelKey: 'basic_channel',
//         actionType: ActionType.Default,

//         title: 'Selamat Datang',
//         body:
//             'Temukan berbagai macam refrensi tampilan desain aplikasi yang menarik dan inspiratif.',

//         roundedBigPicture: true,
//         roundedLargeIcon: true,
//         // criticalAlert: true,
//         locked: false,
//         wakeUpScreen: true,
//         showWhen: true,
//         category: NotificationCategory.Recommendation,
//         notificationLayout: NotificationLayout.BigText,
//         payload: {
//           "id": "143",
//         },
//       ),
//     );
//   }

//   static ReceivePort? receivePort;
// }

// class NotificationController {
//   /// Use this method to detect when a new notification or a schedule is created
//   @pragma("vm:entry-point")
//   static Future<void> onNotificationCreatedMethod(
//       ReceivedNotification receivedNotification) async {
//     // Your code goes here
//   }

//   /// Use this method to detect every time that a new notification is displayed
//   @pragma("vm:entry-point")
//   static Future<void> onNotificationDisplayedMethod(
//       ReceivedNotification receivedNotification) async {
//     // Your code goes here
//   }

//   /// Use this method to detect if the user dismissed a notification
//   @pragma("vm:entry-point")
//   static Future<void> onDismissActionReceivedMethod(
//       ReceivedAction receivedAction) async {
//     // Your code goes here
//   }

//   /// Use this method to detect when the user taps on a notification or action button
//   @pragma("vm:entry-point")
//   static Future<void> onActionReceivedMethod(
//       ReceivedAction receivedAction, BuildContext context) async {
//     try {
//       log(receivedAction.payload.toString());

//       log(Navigator.canPop(context).toString());
//       context.go("/");

//       Future.delayed(Duration(milliseconds: 200), () async {
//         if (receivedAction.payload?["id"] == null) {
//         } else {
//           // Navigator.of(context).push(
//           //   MaterialPageRoute(
//           //     builder: (context) => DetailView(
//           //       id: receivedAction.payload!["id"]!,
//           //     ),
//           //   ),
//           // );
//           GoRouter.of(context).go('/details/${receivedAction.payload!["id"]!}');
//         }
//       });
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
