import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter webview issue'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  /// Created by clicking on social network "share" buttons.
  final twitterHtml =
      """<blockquote class="twitter-tweet" data-media-max-width="560"><p lang="en" dir="ltr">Coming in hot... it&#39;s Flutter 3.35 ⚡<br><br>We have updates to hot reload, a new Dart and Flutter MCP server, and more. See what&#39;s new → <a href="https://t.co/S1JBfnxKOo">https://t.co/S1JBfnxKOo</a> <a href="https://t.co/TMFIUOtySf">pic.twitter.com/TMFIUOtySf</a></p>&mdash; Flutter (@FlutterDev) <a href="https://twitter.com/FlutterDev/status/1956060796657545268?ref_src=twsrc%5Etfw">August 14, 2025</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>""";
  final youtubeHtml =
      """<iframe width="560" height="315" src="https://www.youtube.com/embed/aPUZqab-07c?si=adioD5xkMlBhKhOV" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>""";
  final tiktokHtml =
      """<blockquote class="tiktok-embed" cite="https://www.tiktok.com/@gopro/video/7548568118587706679" data-video-id="7548568118587706679" style="max-width: 605px;min-width: 325px;" > <section> <a target="_blank" title="@gopro" href="https://www.tiktok.com/@gopro?refer=embed">@gopro</a> Precision meets power 💪 POV from @Jason_kiteboarding’s HERO13 Black. <a title="gopro" target="_blank" href="https://www.tiktok.com/tag/gopro?refer=embed">#gopro</a> <a title="pov" target="_blank" href="https://www.tiktok.com/tag/pov?refer=embed">#pov</a> <a title="kiteboarding" target="_blank" href="https://www.tiktok.com/tag/kiteboarding?refer=embed">#kiteboarding</a> <a title="bigair" target="_blank" href="https://www.tiktok.com/tag/bigair?refer=embed">#bigair</a> <a title="kitesurfing" target="_blank" href="https://www.tiktok.com/tag/kitesurfing?refer=embed">#kitesurfing</a> <a target="_blank" title="♬ original sound - GoPro" href="https://www.tiktok.com/music/original-sound-7548568251274398478?refer=embed">♬ original sound - GoPro</a> </section> </blockquote> <script async src="https://www.tiktok.com/embed.js"></script>""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          if (index == 0)
            Expanded(
              key: Key("1"),
              child: Column(
                children: [
                  Text("PlaybackMediaTypes = {audio, music}"),
                  Expanded(
                    child: OfficialWebViewExample(
                      data: twitterHtml,
                      mediaTypes: {
                        PlaybackMediaTypes.audio,
                        PlaybackMediaTypes.video,
                      },
                    ),
                  ),
                  Text("PlaybackMediaTypes = {}"),
                  Expanded(
                    child: OfficialWebViewExample(
                      data: twitterHtml,
                      mediaTypes: {},
                    ),
                  ),
                ],
              ),
            ),
          if (index == 1)
            Expanded(
              key: Key("2"),
              child: Column(
                children: [
                  Text("PlaybackMediaTypes = {audio, music}"),
                  Expanded(
                    child: OfficialWebViewExample(
                      data: youtubeHtml,
                      mediaTypes: {
                        PlaybackMediaTypes.audio,
                        PlaybackMediaTypes.video,
                      },
                    ),
                  ),
                  Text("PlaybackMediaTypes = {}"),
                  Expanded(
                    child: OfficialWebViewExample(
                      data: youtubeHtml,
                      mediaTypes: {},
                    ),
                  ),
                ],
              ),
            ),
          if (index == 2)
            Expanded(
              key: Key("3"),
              child: Column(
                children: [
                  Text("PlaybackMediaTypes = {audio, music}"),
                  Expanded(
                    child: OfficialWebViewExample(
                      data: tiktokHtml,
                      mediaTypes: {
                        PlaybackMediaTypes.audio,
                        PlaybackMediaTypes.video,
                      },
                    ),
                  ),
                  Text("PlaybackMediaTypes = {}"),
                  Expanded(
                    child: OfficialWebViewExample(
                      data: tiktokHtml,
                      mediaTypes: {},
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.newspaper), label: 'Twitter'),
          NavigationDestination(
            icon: Icon(Icons.video_collection),
            label: 'Youtube',
          ),
          NavigationDestination(icon: Icon(Icons.tiktok), label: 'TikTok'),
        ],
        onDestinationSelected: (int index) =>
            setState(() => this.index = index),
        selectedIndex: index,
      ),
    );
  }
}

class OfficialWebViewExample extends StatefulWidget {
  final String data;
  final Set<PlaybackMediaTypes> mediaTypes;

  const OfficialWebViewExample({
    super.key,
    required this.data,
    required this.mediaTypes,
  });

  @override
  State<OfficialWebViewExample> createState() => _OfficialWebViewExampleState();
}

class _OfficialWebViewExampleState extends State<OfficialWebViewExample> {
  late WebViewController controller;

  @override
  void initState() {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: widget.mediaTypes,
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    controller = WebViewController.fromPlatformCreationParams(params)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(widget.data);
    // ···
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(widget.mediaTypes.isNotEmpty);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
