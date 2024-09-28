import 'package:flutter/material.dart';
import 'package:netflix/data/only_on_netflix.dart';
import 'package:netflix/view/home/view/single_detail_screen.dart';

class OnlyOnNetflix extends StatefulWidget {
  const OnlyOnNetflix({Key? key}) : super(key: key);

  @override
  _OnlyOnNetflixState createState() => _OnlyOnNetflixState();
}

class _OnlyOnNetflixState extends State<OnlyOnNetflix> {
  OnlyOnNetflixData netflixOriginal = OnlyOnNetflixData();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: netflixOriginal.onlyOnNetflix.keys.map((key) {
          final netflixOnly = netflixOriginal.onlyOnNetflix[key];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NetflixDetailScreen(netflixItem: netflixOnly),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .5,
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          netflixOriginal.onlyOnNetflix[key]['image'],
                        ),
                        onError: (exception, stackTrace) {
                          Text('Error loading image: $exception');
                        },
                      ),
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 180,
                          left: 50,
                          child: Image(
                              height: 20,
                              image:
                                  AssetImage('assets/images/logo_netflix.png')),
                        ),
                        Positioned(
                            top: 180,
                            left: 75,
                            child: Text(
                              netflixOriginal.onlyOnNetflix[key]['type'],
                              style: const TextStyle(color: Colors.white),
                            )),
                        Positioned(
                            top: 160,
                            left: 5,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width * .5,
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(netflixOriginal
                                      .onlyOnNetflix[key]['titleImage'])),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
