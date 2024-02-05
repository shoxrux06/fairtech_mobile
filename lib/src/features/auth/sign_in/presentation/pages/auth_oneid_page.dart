import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';

class AuthOneIDPage extends StatefulWidget {
  const AuthOneIDPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthOneIDPage> createState() => _AuthOneIDPageState();
}

class _AuthOneIDPageState extends State<AuthOneIDPage> {
  String baseUrl =
      'https://sso.egov.uz/sso/oauth/Authorization.do?response_type=one_code&client_id=fair_tech&redirect_uri=https://fairtech.uz/one-id/login&scope=fair_tech&state=eyJtZXRob2QiOiJJRFBXIn0=';
  String redirectUrl = 'https://fairtech.uz/one-id/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
            onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: InAppWebView(
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              clearCache: true,
            ),
          ),
          initialUrlRequest: URLRequest(
            url: Uri.parse(baseUrl),
          ),
          onLoadStart: (_, url) {
            if (url.toString().contains(redirectUrl) &&
                url?.queryParameters['code'] != null) {
              log(
                url!.queryParameters['code'].toString(),
              );

              /// get code and pop
              context.pop(
                {
                  'code': '${url.queryParameters['code']}',
                  'state': '${url.queryParameters['state']}',
                },
              );
            }
          },
        ),
      ),
    );
  }
}
