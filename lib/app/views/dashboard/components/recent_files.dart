import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srs_admin/app/constants/colors.dart';
import 'package:srs_admin/app/constants/names.dart';
import 'package:srs_admin/app/model/recent_clients.dart';

class RecentClients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${Names.RECENTCLIENTS}",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              horizontalMargin: 0,
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label: Text("${Names.ID}"),
                ),
                DataColumn(
                  label: Text("${Names.EMAIL}"),
                ),
                DataColumn(
                  label: Text("${Names.DATE}"),
                ),
                DataColumn(
                  label: Text("${Names.VIEW}"),
                ),
              ],
              rows: List.generate(
                demoRecentClients.length,
                (index) => RecentClientDataRow(demoRecentClients[index], index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow RecentClientDataRow(RecentClient fileInfo, int id) {
  return DataRow(
    cells: [
      DataCell(Text(
        '$id',
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      )),
      DataCell(Text(
        fileInfo.email,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      )),
      DataCell(Text(
        fileInfo.date,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      )),
      DataCell(IconButton(
        onPressed: () {
          Get.dialog(AlertDialog(
            title: Text("soubscription"),
            content: Text(
              "id: $id\nemail:  ${fileInfo.email}\n\nTap on next to subscribe this user. You can assign the service and the type of subscription to it.",
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () => Get.back(), child: Text("back")),
                  TextButton(onPressed: () => Get.back(), child: Text("next")),
                ],
              )
            ],
          ));
        },
        icon: Icon(
          Icons.remove_red_eye,
          color: primaryColor,
        ),
      )),
    ],
  );
}
