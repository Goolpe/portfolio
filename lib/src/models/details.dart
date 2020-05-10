
import 'package:flutter/material.dart';

class PortfolioDetails {
  PortfolioDetails({
    this.id,
    this.child,
    @required this.name,
    @required this.logo,
    this.images = const [],
    this.description = '',
    this.googlePlayLink,
    this.appStoreLink,
    this.githubLink
  });

  final int id;
  final Widget child;
  final String name;
  final String logo;
  final String description;
  final List<String> images;
  final String googlePlayLink;
  final String appStoreLink;
  final String githubLink;
}