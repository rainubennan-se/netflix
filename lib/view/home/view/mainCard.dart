import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .7,
          width: MediaQuery.of(context).size.width * .93,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.white)),
            // color: Colors.red,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsPZCpPnND7eA804b3h9b3q2ariIV-W7yqPQ&s'),
                    ),
                  ),
                ),
                const Positioned(
                  top: 255,
                  left: 120,
                  child: Row(
                    children: [
                      Image(
                          height: 25,
                          image: AssetImage('assets/images/logo_netflix.png')),
                      Text(
                        'S E R I E S',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                const Positioned(
                    top: 275,
                    left: 75,
                    child: Image(
                        height: 100,
                        image: AssetImage(
                            'assets/images/StrangerThings_Title2.png'))),
                Positioned(
                  top: 370,
                  left: 20,
                  child: SizedBox(
                    height: 35,
                    width: 130.0,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const BeveledRectangleBorder()),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                            ),
                            Text(
                              'Play',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )),
                  ),
                ),
                Positioned(
                  top: 370,
                  left: 175,
                  child: SizedBox(
                    height: 35,
                    width: 130.0,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade700,
                            shape: const BeveledRectangleBorder()),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              'My List',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
