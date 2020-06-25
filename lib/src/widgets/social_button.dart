import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSocialButton extends StatelessWidget {
  const PortfolioSocialButton({
    this.link,
    @required this.icon,
    @required this.title,
    @required this.padding
  });

  final String link;
  final IconData icon;
  final String title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return link == null
    ? SizedBox()
    : Padding(
      padding: padding,
      child: FlatButton.icon(
        color: Colors.white,
        onPressed: () async {
          if (await canLaunch(link)) {
            await launch(link);
          }
        },
        icon: Icon(icon, size: 30),
        label: Text(title.toUpperCase())
      )
    );
  }
}