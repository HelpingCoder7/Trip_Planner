// ignore_for_file: non_constant_identifier_names
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PLAN TOUR TRIP'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Search ',
                    suffixIcon: const Icon(Icons.search)),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Padding(
              padding:  EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'TEMPLES',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  suggestionContainer(
                      './assets/images/keadrnath.jpg', 'KEDARNATH'),
                  suggestionContainer('./assets/images/hari.jpeg', 'HARIDAWAR'),
                  suggestionContainer(
                      './assets/images/badrinath.webp', 'BADRINATH'),
                  suggestionContainer(
                      './assets/images/amarnath.jpg', 'AMARNATH'),
                  suggestionContainer(
                      './assets/images/amarnath.jpg', 'AMARNATH'),
                  suggestionContainer(
                      './assets/images/amarnath.jpg', 'AMARNATH'),
                ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'RECOMMENDATION',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    suggestionContainer('./assets/images/masuri.jpg', 'MASURI'),
                    suggestionContainer(
                        './assets/images/kashmir.jpg', 'KASHMIR'),
                    suggestionContainer(
                        './assets/images/havamahal.jpeg', 'INDOR'),
                    suggestionContainer(
                        './assets/images/amarnath.jpg', 'AMARNATH'),
                    suggestionContainer(
                        './assets/images/amarnath.jpg', 'AMARNATH'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'PRE-PLANNED TRIPS',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            selectTrip('./assets/images/jaipur.jpeg', 'JAIPUR', 'RAJAISTHAN',
                'PRICE- 5000', '5 DAYS TRIP'),
            selectTrip('./assets/images/jaipur.jpeg', 'JAIPUR', 'RAJAISTHAN',
                'PRICE- 5000', '5 DAYS TRIP'),
            selectTrip('./assets/images/jaipur.jpeg', 'JAIPUR', 'RAJAISTHAN',
                'PRICE- 5000', '5 DAYS TRIP'),
            selectTrip('./assets/images/jaipur.jpeg', 'JAIPUR', 'RAJAISTHAN',
                'PRICE- 5000', '5 DAYS TRIP'),
            selectTrip('./assets/images/jaipur.jpeg', 'JAIPUR', 'RAJAISTHAN',
                'PRICE- 5000', '5 DAYS TRIP'),
            selectTrip('./assets/images/jaipur.jpeg', 'JAIPUR', 'RAJAISTHAN',
                'PRICE- 5000', '5 DAYS TRIP'),
          ])),
    );
  }

  suggestionContainer(imagelink, textdata) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 150,
        width: 150,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Column(children: [
          Image.asset(
            imagelink,
            height: 120,
            width: 120,
          ),
          Text(
            textdata,
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }

  selectTrip(link, placename, location, visitprice, triptime) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Row(children: [
          Image.asset(
            link,
            height: 200,
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  placename,
                  style:
                      const TextStyle(fontSize: 25, color: Colors.blueAccent),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  location,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  visitprice,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(triptime,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ])
      ]),
    );
  }
}
