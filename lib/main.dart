import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  CarouselSlider? carouselSlider;
  List _imageList = [SliderWidget()];

  List<T> map<T>(List list, Function function) {
    List<T> result = [];

    for (var i = 0; i < list.length; i++) {
      result.add(function(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          carouselSlider = CarouselSlider(
            items: _imageList.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return image;
                },
              );
            }).toList(),
            options: CarouselOptions(
                height: 100.0,
                autoPlay: true,
                aspectRatio: 2.0,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlayInterval: const Duration(
                  seconds: 3,
                ),
                onPageChanged: ((index, reason) {
                  setState(() {
                    _index = index;
                  });
                })),
          )
        ],
      )),
    );
  }
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: const BoxDecoration(color: Colors.amber),
        child: Text(
          'text',
          style: const TextStyle(fontSize: 16.0),
        ));
  }
}
