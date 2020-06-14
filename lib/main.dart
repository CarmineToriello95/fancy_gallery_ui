import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fancy_photo_gallery_ui/tridimensional_carousel/tridimensional_carousel.dart';
import 'package:fancy_photo_gallery_ui/tridimensional_carousel/tridimensional_carousel_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fancy photo gallery',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TridimensionalCarouselController _controller =
      TridimensionalCarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackgroundPage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 8.0,
              ),
              Container(
                child: TridimensionalCarousel(
                  controller: _controller,
                  loopMode: true,
                  enableScroll: true,
                  items: List.generate(
                    3,
                    (index) => Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height - 200,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/image_${index + 1}.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  onPageChanged: (int index) {
                    print(index);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.orange,
                    ),
                    iconSize: 30.0,
                    onPressed: () => _controller.previousPage(),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.orange,
                    ),
                    iconSize: 30.0,
                    onPressed: () => _controller.nextPage(),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BackgroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black26),
        ),
      ),
    );
  }
}
