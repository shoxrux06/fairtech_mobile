// import 'package:fairtech_mobile/src/config/themes/themes.dart';
// import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
// import 'package:fairtech_mobile/src/core/extension/extension.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class AboutApp extends StatelessWidget {
//   const AboutApp({super.key});
//
//   _launchInstagram() async {
//     const nativeUrl = "instagram://user?username=afishamarket.uz";
//     const webUrl = "https://www.instagram.com/p/CEELs6zAmr-/";
//     if (await canLaunch(nativeUrl)) {
//       await launch(nativeUrl);
//     } else if (await canLaunch(webUrl)) {
//       await launch(webUrl);
//     } else {
//       print("can't open Instagram");
//     }
//   }
//
//   void _launchTelegram() async {
//     String url = "https://telegram.me/soliqnews";
//     print("launchingUrl: $url");
//     if (await canLaunch(url)) {
//       await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
//     }
//   }
//
//   void _launchYoutube() async {
//     String url = "https://www.youtube.com/";
//     print("launchingUrl: $url");
//     if (await canLaunch(url)) {
//       await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
//     }
//   }
//
//   void _launchUrl() async {
//     String url = "https://my.fairtech.uz/";
//     print("launchingUrl: $url");
//     if (await canLaunch(url)) {
//       await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.info),
//             const Text('Talqin: 1.0.0'),
//             TextButton(
//               onPressed: () {
//                 _launchUrl();
//               },
//               child: Text(
//                 'https://fairtech.uz/',
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Divider(
//               height: 2,
//               color: context.theme.primaryColor,
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       _launchInstagram();
//                     },
//                     child: Image.asset(
//                       AppConstants.instagramPng,
//                       height: 32,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       _launchTelegram();
//                     },
//                     child: Image.asset(
//                       AppConstants.telegramPng,
//                       height: 32,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       _launchYoutube();
//                     },
//                     child: Image.asset(
//                       AppConstants.youTubePng,
//                       height: 32,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             const Text(
//               'Barcha huquqlar himoyalangan, Sayt materiallaridan foydalanishda, saytni havola qilish talab qilinadi',
//               textAlign: TextAlign.center,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
