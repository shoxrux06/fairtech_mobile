import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

class DynamicLinkProvider {
  Future<String> createLink(String refCode) async{
    final String url = 'https://com.raqobat.fairtech_mobile?ref=$refCode';

    final parameters = DynamicLinkParameters(
      link: Uri.parse(url),
      androidParameters: const AndroidParameters(
        packageName: 'com.raqobat.fairtech_mobile',
        minimumVersion: 0,
      ),
      uriPrefix: "https://fairtechmobile.page.link",
    );

    final link = await FirebaseDynamicLinks.instance;
    final refLink = await link.buildShortLink(parameters);
    return refLink.shortUrl.toString();
  }

  void initDynamicLink() async{
    final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if(instanceLink != null){
      final Uri refLink = instanceLink.link;
      Share.share("THIS IS THE LINK ${refLink.data}");
    }
  }
}
