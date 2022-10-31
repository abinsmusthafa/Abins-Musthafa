import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/fire_base/firebase_db.dart';
import 'package:flutter_svg/svg.dart';

import 'area_info_text.dart';
import 'coding.dart';
import 'knowledges.dart';
import 'my_info.dart';
import 'skills.dart';
import 'dart:js' as js;


class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            MyInfo(),
            Expanded(
              child: SingleChildScrollView(
                controller: ScrollController(),
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    AreaInfoText(
                      title: "Residence",
                      text: "Kerala",
                    ),
                    AreaInfoText(
                      title: "City",
                      text: "Ernakulam",
                    ),
                    AreaInfoText(
                      title: "Age",
                      text: "28",
                    ),
                    Skills(),
                    SizedBox(height: defaultPadding),
                    Coding(),
                    // Knowledges(),
                    Divider(),
                    SizedBox(height: defaultPadding / 2),
                    TextButton(
                      onPressed: () {
                        FireStoreDataBase().downLoadCV();
                      },
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              "DOWNLOAD CV",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                            ),
                            SizedBox(width: defaultPadding / 2),
                            SvgPicture.asset("assets/icons/download.svg")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: defaultPadding),
                      color: Color(0xFF24242E),
                      child: Row(
                        children: [
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              FireStoreDataBase().socialMedia({"Media": "linkedin", 'createdOn': FieldValue.serverTimestamp()});
                              js.context.callMethod('open', ["https://www.linkedin.com/in/abins-musthafa/"]);

                            },
                            icon: SvgPicture.asset("assets/icons/linkedin.svg"),
                          ),
                          IconButton(
                            onPressed: () {
                              FireStoreDataBase().socialMedia({"Media": "github", 'createdOn': FieldValue.serverTimestamp()});

                              js.context.callMethod('open', ["https://github.com/abinsmusthafa"]);
                            },
                            icon: SvgPicture.asset("assets/icons/github.svg"),
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: SvgPicture.asset("assets/icons/twitter.svg"),
                          // ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
