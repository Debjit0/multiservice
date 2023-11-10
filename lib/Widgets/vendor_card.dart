import 'package:flutter/material.dart';



class VendorCard  extends StatelessWidget{
  VendorCard({required this.name, required this.email});
  String name;
  String email;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: ListTile(
        
        //decoration: BoxDecoration(color: Colors.red),
        //child: Column
          //children: [
            title:Text(name),
            subtitle:Text(email),
          //],
        //)
      ),
    );
  }
}
