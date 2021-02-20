import 'package:url_launcher/url_launcher.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

sendMail() {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'ikramhasan.dev@gmail.com',
    queryParameters: {
      'subject': 'Bug!(AQI)',
    },
  );
  launch(_emailLaunchUri.toString());
}
