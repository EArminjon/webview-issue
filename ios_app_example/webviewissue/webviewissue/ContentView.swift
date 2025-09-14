import SwiftUI

struct ContentView: View {
    @State private var index = 0
    
    // Define the variable using a multiline string literal
    let twitterHtml = """
    <blockquote class="twitter-tweet" data-media-max-width="560"><p lang="en" dir="ltr">Coming in hot... it&#39;s Flutter 3.35 ⚡<br><br>We have updates to hot reload, a new Dart and Flutter MCP server, and more. See what&#39;s new → <a href="https://t.co/S1JBfnxKOo">https://t.co/S1JBfnxKOo</a> <a href="https://t.co/TMFIUOtySf">pic.twitter.com/TMFIUOtySf</a></p>&mdash; Flutter (@FlutterDev) <a href="https://twitter.com/FlutterDev/status/1956060796657545268?ref_src=twsrc%5Etfw">August 14, 2025</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
    """
    private let youtubeHtml = """
    <iframe width="560" height="315" src="https://www.youtube.com/embed/aPUZqab-07c?si=adioD5xkMlBhKhOV" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
    """;
    
    private let tiktokHtml = """
<blockquote class="tiktok-embed" cite="https://www.tiktok.com/@gopro/video/7548568118587706679" data-video-id="7548568118587706679" style="max-width: 605px;min-width: 325px;" > <section> <a target="_blank" title="@gopro" href="https://www.tiktok.com/@gopro?refer=embed">@gopro</a> Precision meets power 💪 POV from @Jason_kiteboarding’s HERO13 Black. <a title="gopro" target="_blank" href="https://www.tiktok.com/tag/gopro?refer=embed">#gopro</a> <a title="pov" target="_blank" href="https://www.tiktok.com/tag/pov?refer=embed">#pov</a> <a title="kiteboarding" target="_blank" href="https://www.tiktok.com/tag/kiteboarding?refer=embed">#kiteboarding</a> <a title="bigair" target="_blank" href="https://www.tiktok.com/tag/bigair?refer=embed">#bigair</a> <a title="kitesurfing" target="_blank" href="https://www.tiktok.com/tag/kitesurfing?refer=embed">#kitesurfing</a> <a target="_blank" title="♬ original sound - GoPro" href="https://www.tiktok.com/music/original-sound-7548568251274398478?refer=embed">♬ original sound - GoPro</a> </section> </blockquote> <script async src="https://www.tiktok.com/embed.js"></script>
"""
    
    var body: some View {
        VStack {
            if index == 0 {
                ExampleSection(title: "Twitter", html: twitterHtml)
            } else if index == 1 {
                ExampleSection(title: "YouTube", html: youtubeHtml)
            } else {
                ExampleSection(title: "TikTok", html: tiktokHtml)
            }
            
            Spacer()
            
            HStack {
                Button("Twitter") { index = 0 }
                Spacer()
                Button("YouTube") { index = 1 }
                Spacer()
                Button("TikTok") { index = 2 }
            }
            .padding()
        }
    }
}

struct ExampleSection: View {
    let title: String
    let html: String
    
    var body: some View {
        VStack {
            Text("PlaybackMediaTypes = {audio, video}")
            WebView(html: html, gestureRequired: true)
                .frame(height: 250)
            
            Text("PlaybackMediaTypes = {}")
            WebView(html: html, gestureRequired: false)
                .frame(height: 250)
        }
    }
}
