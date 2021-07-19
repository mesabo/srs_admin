import 'package:srs_admin/app/constants/colors.dart';
import 'package:srs_admin/app/constants/names.dart' show Names;
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String svgSrc, title, totalStorage;
  final int numOfFiels, percentage;
  final Color color;

  CloudStorageInfo(
      {this.svgSrc = '',
      this.title = '',
      this.totalStorage = '',
      this.numOfFiels = 0,
      this.percentage = 0,
      this.color = Colors.white});
}

List demoMyFiels = [
  CloudStorageInfo(
    title: "${Names.USERS}",
    numOfFiels: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "19.9k",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "${Names.CLIENTS}",
    numOfFiels: 1328,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "271.9k",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "${Names.NEWCLIENT}",
    numOfFiels: 1328,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "102k",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "${Names.SUBSCRIPTIONS}",
    numOfFiels: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "73.3k",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
