import 'package:flutter/material.dart';
import 'package:netflix/data/new_on_netflix.dart';
import 'package:netflix/view/home/view/single_detail_screen.dart';

class NewOnNetflix extends StatefulWidget {
  const NewOnNetflix({Key? key}) : super(key: key);

  @override
  _NewOnNetflixState createState() => _NewOnNetflixState();
}

class _NewOnNetflixState extends State<NewOnNetflix> {
  NewOnNetflixData onNetflix = NewOnNetflixData();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: onNetflix.newOnNetflix.keys.map((key) {
        final netflixItem = onNetflix.newOnNetflix[key];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    NetflixDetailScreen(netflixItem: netflixItem),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.width * .3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(onNetflix.newOnNetflix[key]['image']),
                    ),
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        child: Image(
                          fit: BoxFit.cover,
                          height: 20,
                          image: AssetImage('assets/images/logo_netflix.png'),
                        ),
                      ),
                      Positioned(
                          top: 95,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .3,
                            child: Image(
                                fit: BoxFit.cover,
                                height: 2,
                                image: AssetImage(
                                    onNetflix.newOnNetflix[key]['titleImage'])),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }).toList()),
    );
  }
}
