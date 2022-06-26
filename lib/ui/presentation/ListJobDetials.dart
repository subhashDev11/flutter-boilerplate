import 'package:flutter/material.dart';

class ListJobDetials extends StatefulWidget {
  const ListJobDetials({Key? key}) : super(key: key);

  @override
  State<ListJobDetials> createState() => _ListJobDetialsState();
}

class _ListJobDetialsState extends State<ListJobDetials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        width: double.infinity,
        color: Colors.teal,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topLeft,
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.arrow_back,color: Colors.white),),),
              const SizedBox(
                height: 30,
              ),
              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.tealAccent,
                child: Icon(Icons.wb_sunny,size: 50,),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Text('Type',style: TextStyle(fontWeight: FontWeight.w700),),
                        Text('Patrolling')
                      ],
                    ),
                    Column(
                      children: const [
                        Text('Total check point',style: TextStyle(fontWeight: FontWeight.w700)),
                        Text('8')
                      ],
                    ),
                    Column(
                      children: const [
                        Text('Location',style: TextStyle(fontWeight: FontWeight.w700)),
                        Text('XYZ')
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
