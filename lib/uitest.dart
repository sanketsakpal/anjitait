import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Kidsui extends StatefulWidget {
  const Kidsui({Key? key}) : super(key: key);

  @override
  _KidsuiState createState() => _KidsuiState();
}

class _KidsuiState extends State<Kidsui> {
  final List<String> images = [
    'https://media.istockphoto.com/photos/young-woman-snorkeling-with-coral-reef-fishes-picture-id939931682?s=612x612',
    'https://media.istockphoto.com/photos/woman-relaxing-in-sleeping-bag-on-red-mat-camping-travel-vacations-in-picture-id1210134412?s=612x612',
    'https://media.istockphoto.com/photos/green-leaf-with-dew-on-dark-nature-background-picture-id1050634172?s=612x612',
    'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?s=612x612',
    // 'https://www.istockphoto.com/en/photo/woman-standing-and-looking-at-lago-di-carezza-in-dolomites-gm1038870630-278083784',
    'https://media.istockphoto.com/photos/picturesque-morning-in-plitvice-national-park-colorful-spring-scene-picture-id1093110112?s=612x612',
    'https://media.istockphoto.com/photos/connection-with-nature-picture-id1174472274?s=612x612',
    'https://media.istockphoto.com/photos/in-the-hands-of-trees-growing-seedlings-bokeh-green-background-female-picture-id1181366400',
    'https://media.istockphoto.com/photos/winding-road-picture-id1173544006?s=612x612',
    'https://media.istockphoto.com/photos/sunset-with-pebbles-on-beach-in-nice-france-picture-id1157205177?s=612x612',
    'https://media.istockphoto.com/photos/waves-of-water-of-the-river-and-the-sea-meet-each-other-during-high-picture-id1166684037?s=612x612',
    'https://media.istockphoto.com/photos/happy-family-mother-father-children-son-and-daughter-on-sunset-picture-id1159094800?s=612x612',
    'https://media.istockphoto.com/photos/butterflies-picture-id1201252148?s=612x612',
    'https://media.istockphoto.com/photos/beautiful-young-woman-blows-dandelion-in-a-wheat-field-in-the-summer-picture-id1203963917?s=612x612',
    'https://media.istockphoto.com/photos/summer-meadow-picture-id1125637203?s=612x612',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/home-header.png"),
                              fit: BoxFit.cover))),
                  Positioned(
                    top: 80,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/story-top-cloud.png"),
                                fit: BoxFit.cover))),
                  ),
                  Positioned(
                    top: 2,
                    bottom: 10,
                    left: 20,
                    right: 30,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 200.0,
                  width: double.infinity,
                  child: Carousel(
                    autoplay: false,
                    radius: Radius.circular(10),
                    // borderRadius: true,
                    dotSpacing: 15.0,
                    dotSize: 8.0,
                    dotIncreasedColor: Colors.grey,
                    dotBgColor: Colors.transparent,
                    dotPosition: DotPosition.bottomCenter,
                    images: images
                        .map((item) => Container(
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8QYJuD5GbDcJ7CqfpdbYuy_1mBVGDGX-w4A&usqp=CAU"),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Everyday Stories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topCenter,
                height: 280,
                width: double.infinity,
                //  color: Colors.yellowAccent,
                child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    return listView();
                  },
                  separatorBuilder: (ctx, div) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget listView() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 180,
          width: 180,
          // color: Colors.amber,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQINpBuBOYmbzjjD2yozXr1OEKzSgbbc5hmEw&usqp=CAU"),
            ),
          ),
        ),
        Positioned(
          top: 200,
          bottom: 20,
          right: 20,
          left: 20,
          child: Image.asset(
            "assets/play.png",
            height: 150,
            width: 150,
          ),
        )
      ],
    );
  }
}
