import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  ServiceCard({required this.name, required this.rate});
  String name;
  String rate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 226, 226, 226)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Gardening.jpg"),fit: BoxFit.fill), borderRadius: BorderRadius.circular(10)),
                height: 80,
                width: 80,
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(name), Text(rate)],
                ),
              )
            ],
          ),
        ));
  }
}
