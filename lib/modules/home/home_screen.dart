import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import 'donateByEvent/donate_by_event_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(userId)
                      .snapshots(),
                  builder: (context, snapshot) {
                    var data = snapshot.data?.data();
                    if (!snapshot.hasData) {
                      // Handle the case where data is not available yet.
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      // Handle the case where an error occurred.
                      return Text('Error: ${snapshot.error}');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      ));
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome to ',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Life Saver',
                                style: GoogleFonts.bangers(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: mainColor),
                              ),
                              Text(
                                ', ${data?['name']}',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'The best place to donate blood',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      );
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [Colors.black, mainColor],
                      )),
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Positioned(
                        right: -300,
                        bottom: -50,
                        top: 50,
                        left: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/logo.png'))),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        right: 70,
                        child: Text(
                          'The measure of life is not its DURATION but its DONATION.',
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 10,
                        child: Text(
                          'Life Saver',
                          style: GoogleFonts.bangers(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, bottom: 5, top: 10),
                    child: Text(
                      'Events',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                          color: mainColor),
                    ),
                  ),
                  SizedBox(
                    height: 410,
                    width: double.infinity,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('events')
                            .snapshots(),
                        builder: (context, snapshot) {
                          var dataLength = snapshot.data?.docs.length;
                          if (!snapshot.hasData) {
                            // Handle the case where data is not available yet.
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            // Handle the case where an error occurred.
                            return Text('Error: ${snapshot.error}');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator(
                              color: Colors.black,
                            ));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var data = snapshot.data?.docs[index].data();
                                var usersId = snapshot.data?.docs[index]
                                    .data()['usersId'];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      height: 400,
                                      width: 320,
                                      clipBehavior: Clip.none,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.30),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 200,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    topLeft:
                                                        Radius.circular(15)),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    opacity: 0.80,
                                                    image: NetworkImage(data?[
                                                        'imageOfEvent']))),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  bottom: 0,
                                                  left: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    color: mainColor
                                                        .withOpacity(0.8),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 20,
                                                              top: 10,
                                                              bottom: 2),
                                                      child: Text(
                                                        data?['nameOfEvent'],
                                                        style: GoogleFonts.lato(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            right: 10,
                                            top: 10,
                                            child: Container(
                                              clipBehavior: Clip.hardEdge,
                                              height: 40,
                                              width: 50,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 7),
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/logo.png'))),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 210,
                                            left: 10,
                                            right: 10,
                                            bottom: 60,
                                            child: SingleChildScrollView(
                                              physics: BouncingScrollPhysics(),
                                              child: Text(
                                                data?['details'],
                                                overflow: TextOverflow.fade,
                                                style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            left: 10,
                                            right: 10,
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 200,
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Column(
                                                        children: [
                                                          LinearProgressBar(
                                                            maxSteps: data?[
                                                                'fixedTarget'],
                                                            progressType:
                                                                LinearProgressBar
                                                                    .progressTypeLinear,
                                                            currentStep:
                                                                data?['target'],
                                                            progressColor:
                                                                mainColor,
                                                            backgroundColor:
                                                                Colors.black,
                                                            minHeight: 8,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    SizedBox(
                                                      width: 200,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Blood bags',
                                                            style: GoogleFonts
                                                                .lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color: mainColor,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            '${data?['target'].toString()}/${data?['fixedTarget']}',
                                                            style: GoogleFonts
                                                                .lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color: mainColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5, bottom: 10),
                                                  child: usersId
                                                          .contains(userId)
                                                      ? Text(
                                                          'Tanks for\nyour donate',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              GoogleFonts.lato(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: mainColor,
                                                          ),
                                                        )
                                                      : Container(
                                                          height: 30,
                                                          width: 80,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color: mainColor,
                                                          ),
                                                          child: Center(
                                                            child: TextButton(
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => DonateByEventScreen(
                                                                                nameOfEvent: data?['nameOfEvent'],
                                                                              )));
                                                                },
                                                                child:
                                                                    FittedBox(
                                                                  child: Text(
                                                                    'Donate',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                )),
                                                          ),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: dataLength,
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [mainColor, Colors.black],
                    )),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 10,
                      bottom: 10,
                      child: Text(
                        'We have reached the number \nof blood donors so far',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 20,
                      child: Text(
                        '0',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [mainColor, Colors.black],
                    )),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 10,
                      bottom: 10,
                      child: Text(
                        'We delivered bags of blood to a number \nof people in need',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 10,
                      child: Text(
                        '0',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
