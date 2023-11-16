// import 'dart:convert';
// import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SocialWebview extends StatefulWidget {
  const SocialWebview({super.key, required this.url});
  final String url;

  @override
  State<SocialWebview> createState() => _SocialWebviewState();
}

class _SocialWebviewState extends State<SocialWebview> {
  WebViewController? controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.url),
        method: LoadRequestMethod.get,
        // headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        // body: Uint8List.fromList(utf8.encode(jsonEncode({
        //   'grant_type': 'client_credentials',
        //   'client_id': widget.id, // identifier,
        //   'client_secret': widget.secret, //secret,
        //   'scope': [
        //     'email',
        //     'profile',
        //     'https://www.googleapis.com/auth/contacts.readonly'
        //   ],
        // 'redirect_uri': 'https://al-kafaat.com/api/social-callback/google',
        // }))),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller != null
          ? WebViewWidget(controller: controller!)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
