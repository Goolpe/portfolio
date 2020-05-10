import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSocialButton extends StatelessWidget {
  PortfolioSocialButton({
    this.link,
    this.icon,
    this.title,
    this.padding
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
      padding: padding ?? EdgeInsets.symmetric(horizontal: 8.0),
      child: FlatButton.icon(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(8)
        ),
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