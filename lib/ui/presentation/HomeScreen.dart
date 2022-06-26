import 'package:flutter/material.dart';
import 'ListJob.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final visibilityNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text("HYAM SERVICES"),
        actions: const [

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Visibility(
                  visible: true,
                  child: Container(
                    height: 35,
                    width: double.infinity,
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Latest action : FINISH',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          width: 250,
                          color: Colors.orange,
                        ),
                        Image.asset(
                          'assets/s1.png',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: visibilityNotifier,
            builder: (context,value,child) {
              return SizedBox(
                height: 240,
                width: double.infinity,
                child: Stack(
                  children: [
                    Visibility(
                      visible: value,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 110,
                                  color: Colors.orange,
                                  child: Stack(
                                    children: const [
                                      Center(
                                        child: Text(
                                          'Scan',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const ListJob()));
                                  },
                                  child: Container(
                                    height: 110,
                                    color: Colors.red,
                                    child: const Center(
                                      child: Text(
                                        'SOS',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 110,
                                  color: Colors.blueGrey,
                                  child: const Center(
                                    child: Text(
                                      'Torch',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  height: 110,
                                  color: Colors.tealAccent[700],
                                  child: const Center(
                                    child: Text(
                                      'Incident Report',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          visibilityNotifier.value = !value;
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                              radius: 33,
                              backgroundColor: Colors.green[800],
                              child: value
                                  ? const Text('End')
                                  : const Text('Start')),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
