import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/admin/detailsOfDonations/eventDonation/completedEventDonation/sepecific_event_screen.dart';
import 'package:hemo_cell/admin/detailsOfDonations/eventDonation/rejectedEventDonation%20copy/sepecific_event_screen.dart';
import 'package:hemo_cell/admin/detailsOfDonations/needBloodDonation/rejectedNeedBloodDonation%20copy/sepecific_event_screen.dart';
import 'package:hemo_cell/shared/components/components.dart';

class RejectepNeedBloodDonation extends StatelessWidget {
  const RejectepNeedBloodDonation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.chevron_left_outlined,
                      size: 32,
                      color: mainColor,
                    )),
                Text(
                  'completed donation',
                  style: GoogleFonts.bangers(
                    fontSize: 24,
                    color: mainColor,
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('ourPlaces')
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
                        var name = snapshot.data?.docs[index];

                        var data = snapshot.data?.docs[index].data();

                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(colors: [
                                  Colors.black,
                                  mainColor,
                                ])),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 25,
                                  right: 10,
                                  top: 20,
                                  child: Text(
                                    name!.id,
                                    style: GoogleFonts.lato(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  right: 5,
                                  bottom: 5,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.chevron_right,
                                      size: 32,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SpecificNeedBloodForRejected(
                                                    data?['nameOfPlace'],
                                                  )));
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: dataLength,
                    ),
                  );
                }
              })
        ],
      ),
    ));
  }
}
