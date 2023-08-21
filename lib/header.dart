import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[700],
      height: 200,width: double.infinity,
    padding: const EdgeInsets.only(top: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[ 
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage("assets/images/suhaib.jpg"))
            ),
          ),
         const Text("Muhammad Suhaib Usman" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
         const Text("suhaibusman54@gmail.com" ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),)

      ]
    ),
    );
  }
}