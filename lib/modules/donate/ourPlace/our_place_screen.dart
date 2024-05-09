import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/modules/donate/ourPlace/specific_place_screen.dart';
import 'package:hemo_cell/modules/needBlood/specificPlace/specific_place_screen.dart';
import 'package:hemo_cell/shared/components/components.dart';

class OurPlaceScreen extends StatelessWidget {
  const OurPlaceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.chevron_left,
                      size: 32,
                      color: mainColor,
                    )),
                Text(
                  'Our Places',
                  style: GoogleFonts.bangers(
                    fontSize: 24,
                    color: mainColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(12),
                child: (Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: StreamBuilder(
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
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.black,
                                ));
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var data =
                                        snapshot.data?.docs[index].data();

                                    return Container(
                                      clipBehavior: Clip.hardEdge,
                                      height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.black,
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            right: -15,
                                            top: 20,
                                            bottom: 10,
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/images/logo.png',
                                                      ),
                                                      opacity: 0.3)),
                                            ),
                                          ),
                                          Positioned(
                                            left: 15,
                                            top: 10,
                                            child: Text(
                                              '${data?['nameOfPlace']}',
                                              style: GoogleFonts.lato(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 24,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            right: 0,
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SpecificPlaceScreen(
                                                                  data)));
                                                },
                                                icon: const Icon(
                                                  Icons.chevron_right,
                                                  size: 32,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, inedx) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: dataLength!,
                                );
                              }
                            }))))),
          ),
        ],
      ),
    );
  }
}
