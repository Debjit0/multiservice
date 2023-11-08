import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiservice/pages/authGoogle.dart';
import 'package:multiservice/theme/color.dart';

class AllServices extends StatefulWidget {
  const AllServices({super.key});

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  _buildHeader() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All Services",
                  style: TextStyle(
                    color: AppColor.darker,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                //name from Google
              ],
            ),
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Get.offAll(AuthScreen());
                },
                icon: Icon(Icons.exit_to_app)),
          ],
        ),
      ],
    );
  }

  _buildBody() {
    return Column();
  }
}
