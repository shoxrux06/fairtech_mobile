import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  void _launchTelegram() async {
    String url = "https://telegram.me/soliqnews";
    print("launchingUrl: $url");
    if (await canLaunch(url)) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  _launchCaller() async {
    const url = "tel:1190";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.tr('help')),
      body: Column(
        children: [
          Divider(height: 1,color: Colors.grey,),
          InkWell(
            onTap: (){
              _launchCaller();
            },
            child:  Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1190', style: context.textStyle.regularTitle1,),
                      Text(
                        context.tr('supportCenter'),
                        style: context.textStyle.regularTitle1,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Divider(height: 1,color: Colors.grey,),
          InkWell(
            onTap: () {

            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
              child: Row(
                children: [
                  Icon(Icons.mic),
                  SizedBox(width: 12,),
                  Column(
                    children: [
                      Text(
                        context.tr('sendVoiceMessage'),
                        style: context.textStyle.regularTitle1,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Divider(height: 1,color: Colors.grey,),
          InkWell(
            onTap: (){
              _launchTelegram();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
              child: Row(
                children: [
                  Image.asset(AppConstants.telegramPng,width: 24,height: 24,),
                  SizedBox(width: 12,),
                  Column(
                    children: [
                      Text(
                        context.tr('sendMessageViaTelegram'),
                        style: context.textStyle.regularTitle1,
                      ),                    ],
                  )
                ],
              ),
            ),
          ),
          Divider(height: 1,color: Colors.grey,),
        ],
      ),
    );
  }
}
