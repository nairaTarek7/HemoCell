import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/admin/detailsOfDonations/eventDonation/detailsDonationViaEvents.dart';
import 'package:hemo_cell/admin/detailsOfDonations/needBloodDonation/detailsOfNeedDonation.dart';
import 'package:hemo_cell/admin/detailsOfDonations/regularDonation/details_regular_donation_screen.dart';
import 'package:hemo_cell/shared/components/components.dart';

class MainDetailsScreen extends StatelessWidget {
  const MainDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        size: 32,
                        color: mainColor,
                      )),
                  Text('Details of donations',
                      style:
                          GoogleFonts.bangers(fontSize: 24, color: mainColor))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 15,
                      top: 10,
                      child: Text(
                        'Donation details via Events',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeatilsDonationViaEvent()));
                          },
                          icon: const Icon(
                            Icons.chevron_right,
                            size: 32,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 15,
                      top: 10,
                      child: Text(
                        'Details of regular donations',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeatailsRegularDonation()));
                          },
                          icon: const Icon(
                            Icons.chevron_right,
                            size: 32,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 15,
                      top: 10,
                      child: Text(
                        'Details of need blood bags',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeatilsNeedBloodDonation()));
                          },
                          icon: const Icon(
                            Icons.chevron_right,
                            size: 32,
                            color: Colors.white,
                          )),
                    )
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
