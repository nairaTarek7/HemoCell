import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/shared/components/components.dart';
import 'package:intl/intl.dart';

class SpecificEventScreen extends StatelessWidget {
  final nameOfEvent;
  SpecificEventScreen(this.nameOfEvent);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 0, right: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left_outlined,
                        size: 32, color: mainColor),
                  ),
                  Text(
                    'Back',
                    style: GoogleFonts.bangers(
                      color: mainColor,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('events')
                    .doc(nameOfEvent)
                    .snapshots(),
                builder: (context, snapshot) {
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
                    return Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) {
                        String formatTimestamp(Timestamp timestamp) {
                          DateTime dateTime = timestamp.toDate().toLocal();
                          var formatter = DateFormat('MMMM dd, yyyy h:mm a');

                          return formatter.format(dateTime);
                        }

                        var data = snapshot.data
                            ?.data()?['listOfDonations']
                            .where((d) => d['isDone'] == true);
                        var d = snapshot.data
                            ?.data()?['listOfDonations']
                            .where((d) => d['isDone'] == true)
                            .toList();

                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  left: 20,
                                  bottom: 20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        d[index]['name'],
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Age:${d[index]['age'].toString()}',
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        d[index]['userId'],
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later,
                                        color: mainColor,
                                        size: 24,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        formatTimestamp(
                                            d?[index]['timestampOfBegin']),
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data
                          ?.data()?['listOfDonations']
                          .where((d) => d['isDone'] == true)
                          .length,
                    ));
                  }
                })
          ]),
        ));
  }
}
