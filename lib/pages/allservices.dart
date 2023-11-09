import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiservice/Widgets/service_card.dart';
import 'package:multiservice/pages/authGoogle.dart';
import 'package:multiservice/theme/color.dart';

class AllServices extends StatefulWidget {
  const AllServices({super.key});

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  var allResults = [];
  var isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    getAllServices().whenComplete(() {
      setState(() {
        isLoading = true;
      });
    });
    super.initState();
  }

  Future getAllServices() async {
    var propDocuments =
        await FirebaseFirestore.instance.collection("Services").get();
    print("Services Length ${propDocuments.docs.length}");
    allResults = (List.from(propDocuments.docs));
    print(allResults[0]["Name"]);
  }

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
        SliverToBoxAdapter(
            child: isLoading ? _buildBody() : _buildBodyLoading())
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

  _buildBodyLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        //Text("data"),
        ListView.builder(
          shrinkWrap: true,
          itemCount: allResults.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
              child: ServiceCard(
                  name: allResults[index]["Name"],
                  rate: allResults[index]["Hourly Rates"]),
            );
          },
        ),
      ],
    );
  }
}
