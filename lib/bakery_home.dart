// import 'package:bakery_website/animation/text_wordart.dart';
// import 'package:url_launcher/url_launcher.dart';

// import 'package:url_launcher/link.dart';
// import './animation/animation.dart';
// import 'package:flutter/material.dart';
// import 'package:bakery_website/buttons/buttons_link.dart';

// class CenteredText extends StatelessWidget {
//   final String text;

//   const CenteredText(this.text);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         text,
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

// class BakeryHomePage extends StatefulWidget {
//   BakeryHomePage({super.key});

//   @override
//   State<BakeryHomePage> createState() => _BakeryHomePageState();
// }

// class _BakeryHomePageState extends State<BakeryHomePage> {
//   bool _hasCallSupport = false;
//   Future<void>? _launched;
//   String _phone = '';
//   @override
//   void initState() {
//     super.initState();
//     // Check for phone call support.
//     canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
//       setState(() {
//         _hasCallSupport = result;
//       });
//     });
//   }

//   Future<void> _launchInBrowser(Uri url) async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.externalApplication,
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Future<void> _launchInWebViewOrVC(Uri url) async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.inAppWebView,
//       webViewConfiguration: const WebViewConfiguration(
//           headers: <String, String>{'my_header_key': 'my_header_value'}),
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Future<void> _launchUniversalLinkIos(Uri url) async {
//     final bool nativeAppLaunchSucceeded = await launchUrl(
//       url,
//       mode: LaunchMode.externalNonBrowserApplication,
//     );
//     if (!nativeAppLaunchSucceeded) {
//       await launchUrl(
//         url,
//         mode: LaunchMode.inAppWebView,
//       );
//     }
//   }

//   Future<void> _launchInWebViewWithoutDomStorage(Uri url) async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.inAppWebView,
//       webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
//     if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     } else {
//       return const Text('');
//     }
//   }

//   Future<void> _makePhoneCall(String phoneNumber) async {
//     final Uri launchUri = Uri(
//       scheme: 'tel',
//       path: phoneNumber,
//     );
//     await launchUrl(launchUri);
//   }

//   _launchPhone() async {
//     final phone = Uri.parse('tel:1234567890');
//     if (await canLaunchUrl(phone)) {
//       await launchUrl(phone);
//     } else {
//       throw 'Could not launch $phone';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         title: WordArtText(
//           text: "Atul Bakery - Jayveer Sales",
//           gradientColors: const [
//             Color.fromARGB(255, 188, 67, 249),
//             Color.fromARGB(255, 47, 110, 255),
//           ],
//           fontSize: 60,
//           fontWeight: FontWeight.w900,
//           textColor: Color.fromARGB(255, 255, 255, 255),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors
//             .transparent, // Set the app bar background color to transparent
//         elevation: 0,
//       ),
//       body: Stack(
//         children: [
//           FancyBackgroundApp(),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const CustomButton(
//                   icon: Icon(Icons.web_stories_outlined),
//                   label: 'Your Prestigious Feedback',
//                   url:
//                       'https://www.google.com/search?q=atul+bakery+bharuch+link&rlz=1C1ONGR_enIN1045IN1045&oq=atul+bakery+bharuch&gs_lcrp=EgZjaHJvbWUqBggAEEUYOzIGCAAQRRg7MgYIARBFGDsyBggCEEUYOzIHCAMQABiABDIHCAQQABiABDIMCAUQABgUGIcCGIAEMgcIBhAAGIAEMgcIBxAAGIAEMggICBAAGBYYHjIICAkQABgWGB7SAQg3NTY2ajBqN6gCALACAA&sourceid=chrome&ie=UTF-8#lrd=0x395f864400000019:0x1b2a27b3c1a02320,1,,,,',
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(16.0),
//                 ),
//                 const CustomButton(
//                   icon: Icon(Icons.web_stories_outlined),
//                   label: 'Follow us Here',
//                   url: 'https://www.instagram.com/atulbakery_bharuch/',
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(16.0),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     final phoneNumber =
//                         '+919081482387'; // Replace with the desired phone number
//                     final url = 'tel:$phoneNumber';
//                     if (await canLaunch(url)) {
//                       await launch(url);
//                     } else {
//                       throw 'Could not launch $url';
//                     }
//                   },
//                   child: Text('Contact Us'),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(16.0),
//                 ),
//                 const CustomButton(
//                   icon: Icon(Icons.web_stories_outlined),
//                   label: 'Visit Our Website',
//                   url: 'https://www.atulbakery.com/',
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(16.0),
//                 ),
//                 Link(
//                   uri: Uri.parse(
//                       'https://www.google.com/maps/dir/21.714312,73.0051052/atul+bakery+bharuch+link/@21.7136403,72.987395,15z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x395f864400000019:0x1b2a27b3c1a02320!2m2!1d72.985778!2d21.7184787?entry=ttu'),
//                   target: LinkTarget.blank,
//                   builder: (BuildContext ctx, FollowLink? openLink) {
//                     return TextButton.icon(
//                       onPressed: openLink,
//                       label: const Text('Direction To Us..'),
//                       icon: const Icon(Icons.map_outlined),
//                     );
//                   },
//                 ),
//                 const Padding(padding: EdgeInsets.all(16.0)),
//                 FutureBuilder<void>(future: _launched, builder: _launchStatus),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

import 'package:bakery_website/animation/text_wordart.dart';
import 'package:bakery_website/buttons/buttons_link.dart';
import './animation/animation.dart';

class CenteredText extends StatelessWidget {
  final String text;

  const CenteredText(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class BakeryHomePage extends StatefulWidget {
  BakeryHomePage({super.key});

  @override
  State<BakeryHomePage> createState() => _BakeryHomePageState();
}

class _BakeryHomePageState extends State<BakeryHomePage> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';

  // ... (rest of your existing methods) ...
  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  _launchPhone() async {
    final phone = Uri.parse('tel:1234567890');
    if (await canLaunchUrl(phone)) {
      await launchUrl(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: WordArtText(
          text: "Atul Bakery - Jayveer Sales",
          gradientColors: const [
            Color.fromARGB(255, 188, 67, 249),
            Color.fromARGB(255, 47, 110, 255),
          ],
          fontSize: MediaQuery.of(context).size.width < 600 ? 25 : 60,
          fontWeight: FontWeight.w900,
          textColor: Color.fromARGB(255, 255, 255, 255),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          bool isTablet =
              constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
          bool isWeb = constraints.maxWidth >= 1200;

          return Stack(
            children: [
              FancyBackgroundApp(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      icon: Icon(Icons.web_stories_outlined),
                      label: 'Your Prestigious Feedback',
                      url:
                          'https://www.google.com/search?q=atul+bakery+bharuch+link&rlz=1C1ONGR_enIN1045IN1045&oq=atul+bakery+bharuch&gs_lcrp=EgZjaHJvbWUqBggAEEUYOzIGCAAQRRg7MgYIARBFGDsyBggCEEUYOzIHCAMQABiABDIHCAQQABiABDIMCAUQABgUGIcCGIAEMgcIBhAAGIAEMgcIBxAAGIAEMggICBAAGBYYHjIICAkQABgWGB7SAQg3NTY2ajBqN6gCALACAA&sourceid=chrome&ie=UTF-8#lrd=0x395f864400000019:0x1b2a27b3c1a02320,1,,,,',
                    ),
                    SizedBox(height: 16),
                    CustomButton(
                      icon: Icon(Icons.web_stories_outlined),
                      label: 'Follow us Here',
                      url: 'https://www.instagram.com/atulbakery_bharuch/',
                    ),
                    SizedBox(height: 16),
                    if (isMobile)
                      ElevatedButton(
                        onPressed: () => _launchPhone(),
                        child: Text('Contact Us'),
                      ),
                    if (isTablet || isWeb)
                      ElevatedButton(
                        onPressed: () async {
                          final phoneNumber = '+919081482387';
                          final url = 'tel:$phoneNumber';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text('Contact Us'),
                      ),
                    SizedBox(height: 16),
                    CustomButton(
                      icon: Icon(Icons.web_stories_outlined),
                      label: 'Visit Our Website',
                      url: 'https://www.atulbakery.com/',
                    ),
                    SizedBox(height: 16),
                    Link(
                      uri: Uri.parse(
                          'https://www.google.com/maps/dir/21.714312,73.0051052/atul+bakery+bharuch+link/@21.7136403,72.987395,15z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x395f864400000019:0x1b2a27b3c1a02320!2m2!1d72.985778!2d21.7184787?entry=ttu'),
                      target: LinkTarget.blank,
                      builder: (BuildContext ctx, FollowLink? openLink) {
                        return TextButton.icon(
                          onPressed: openLink,
                          label: const Text('Direction To Us..'),
                          icon: const Icon(Icons.map_outlined),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    FutureBuilder<void>(
                        future: _launched, builder: _launchStatus),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
