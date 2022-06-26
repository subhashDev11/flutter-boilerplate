import 'package:flutter/material.dart';

import 'ListJobDetials.dart';

class ListJob extends StatefulWidget {
  const ListJob({Key? key}) : super(key: key);

  @override
  State<ListJob> createState() => _ListJobState();
}

class _ListJobState extends State<ListJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.teal,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 10,right: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '13 New job found',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: const Icon(Icons.search),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (_,index){
              return  Column(
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const ListJobDetials()));
                    },
              
                    child: ListTile(
                      isThreeLine: true,
                      title: const Text('Google',style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text('Petrol and Mentoring',style: TextStyle(
                              fontSize: 16,
                            ),),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: 30,
                            child: const Text('Closed'),
                            decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          )
                        ],
                      ),
                      trailing: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network('https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg')),

                    ),
                  ),
                  const Divider(),
                ],
              );
            },
            ),
          )
        ],
      ),
    );
  }
}
