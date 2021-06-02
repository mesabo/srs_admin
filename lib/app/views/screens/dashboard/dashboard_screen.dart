import 'package:flutter/material.dart';
import 'package:srs_admin/app/constants/colors.dart';

import 'components/header.dart';
import 'components/my_fiels.dart';
import 'components/recent_files.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFiels(),
                      SizedBox(height: defaultPadding),
                      RecentClients(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
