import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hemo_cell/shared/components/components.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecificCompleteRegularDonationScreen extends StatelessWidget {
  final nameOfDoc;

  SpecificCompleteRegularDonationScreen(this.nameOfDoc);

  @override
  Widget build(BuildContext context) {
    String formatDate(Timestamp timestamp) {
      DateTime dateTime = timestamp.toDate();
      return DateFormat('d-M-yyyy').format(dateTime);
    }

    String formatTimestamp(Timestamp timestamp) {
      DateTime dateTime = timestamp.toDate().toLocal();
      var formatter = DateFormat('MMMM dd, yyyy h:mm a');
      return formatter.format(dateTime);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 0, right: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left_outlined,
                        size: 32,
                        color:
                            mainColor), // Assuming mainColor is defined somewhere
                  ),
                  Text(
                    'Back',
                    style: GoogleFonts.bangers(
                      color:
                          mainColor, // Assuming mainColor is defined somewhere
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('regularDonations')
                  .doc(formatDate(nameOfDoc).toString())
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  // Handle the case where data is not available yet.
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                } else if (snapshot.hasError) {
                  // Handle the case where an error occurred.
                  return Text('Error: ${snapshot.error}');
                }

                var data = snapshot.data?.data();
                if (data == null ||
                    data['donations'] == null ||
                    data['donations'].isEmpty) {
                  // Handle the case where there are no donations.
                  return Center(
                    child: Text('No donations found.'),
                  );
                }

                var donations = data['donations']
                    .where((d) => d['isDone'] == true)
                    .toList();

                return donations.isEmpty
                    ? Center(
                        child: Text('No donations found.'),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            var d = donations[index];
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
                                            d['name'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Age:${d['age'].toString()}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            d['userId'],
                                            style: TextStyle(
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
                                            color:
                                                mainColor, // Assuming mainColor is defined somewhere
                                            size: 24,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            formatTimestamp(
                                                d['timestampOfBegin']),
                                            style: TextStyle(
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
                          itemCount: donations.length,
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
