import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guitar Lesson',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 17, 68, 145)),
      ),
      home: const GuitarLessonScreen(),
    );
  }
}

class GuitarLessonScreen extends StatefulWidget {
  const GuitarLessonScreen({super.key});

  @override
  _GuitarLessonScreenState createState() => _GuitarLessonScreenState();
}

class _GuitarLessonScreenState extends State<GuitarLessonScreen> {
  var controller = WebViewController()
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
    ..loadRequest(Uri.parse('https://h5p.org/h5p/embed/1477939'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Actividad: ',
          style: TextStyle(color: Colors.grey[200]),
        ),
        iconTheme: IconThemeData(color: Colors.grey[200]),
        backgroundColor: const Color.fromARGB(255, 17, 68, 145),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Lección: Introducción a la guitarra',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 1000,
              height: 200,
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
