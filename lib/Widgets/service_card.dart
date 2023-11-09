import 'package:flutter/material.dart';



class ServiceCard  extends StatelessWidget{
  ServiceCard({required this.name, required this.rate});
  String name;
  String rate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: ListTile(
        
        //decoration: BoxDecoration(color: Colors.red),
        //child: Column(
          //children: [
            title:Text(name),
            subtitle:Text("\$$rate/hr"),
          //],
        //)
      ),
    );
  }
}
