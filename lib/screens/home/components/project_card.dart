import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/fire_base/firebase_db.dart';
import 'package:flutter_profile/models/Project.dart';
import 'package:flutter_profile/responsive.dart';
import 'dart:js' as js;

import '../../../constants.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Spacer(),
          Text(
            project.description!,
            maxLines: Responsive.isMobileLarge(context) ? 5 : 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 5,),
          Text(
            "Associated with : ${project.associated!}",
            maxLines: Responsive.isMobileLarge(context) ? 5 : 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(height: 1.5,color: Colors.lightBlue),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              try {
                FireStoreDataBase().ClickAppDetails({"ClickAppName": project.title, 'createdOn': FieldValue.serverTimestamp()});
              } catch (e) {}

              js.context.callMethod('open', [project.appstoreLink]);

            },
            child: Text(
              "App Store >>",
              style: TextStyle(color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
