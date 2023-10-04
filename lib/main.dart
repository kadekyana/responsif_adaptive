import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final FullMediaQuery = MediaQuery.of(context).size.height;
    final MyAppBar = AppBar(
      title: Text('Adaptive dan Responsif'),
      centerTitle: true,
    );

    final BodyMediaQuery = FullMediaQuery -
        MyAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bool Landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: MyAppBar,
      body: Center(
        child: (Landscape)
            ? Column(
                children: [
                  Container(
                      height: BodyMediaQuery * 0.5,
                      width: double.infinity,
                      color: Colors.amber),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: BodyMediaQuery * 0.5,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2),
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return GridTile(
                              child: Container(
                            height: BodyMediaQuery * 0.1,
                            color: Color.fromARGB(255, Random().nextInt(256),
                                Random().nextInt(256), Random().nextInt(256)),
                            child: Center(
                              child: Text('Title Product'),
                            ),
                          ));
                        },
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Container(
                      height: BodyMediaQuery * 0.3,
                      width: double.infinity,
                      color: Colors.amber),
                  Container(
                    height: BodyMediaQuery * 0.7,
                    child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(),
                            title: Text('Title Product'),
                          );
                        }),
                  ),
                ],
              ),
      ),
    );
  }
}
