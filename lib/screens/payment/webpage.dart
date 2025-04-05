import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class WebViewPage extends StatelessWidget {
  final String url;

  const WebViewPage(this.url);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // تعيين الاتجاه العادي للصفحة
      child: Scaffold(
        appBar: AppBar(title: const Text("الدفع")),
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri.uri(Uri.parse(url)), // تحويل Uri إلى WebUri
          ),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              javaScriptEnabled: true,
            ),
          ),
        ),
      ),
    );
  }
}
