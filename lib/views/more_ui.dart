import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreUI extends StatefulWidget {
  //const MoreUI({Key? key}) : super(key: key);
  String? name;
  String? mobile;
  String? image;
  String? detail;

  MoreUI({
    this.name,
    this.mobile,
    this.image,
    this.detail,
  });

  @override
  State<MoreUI> createState() => _MoreUIState();
}

class _MoreUIState extends State<MoreUI> {
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
