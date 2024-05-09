import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/admin/detailsOfDonations/eventDonation/completedEventDonation/completed_event_donation1.dart';
import 'package:hemo_cell/admin/detailsOfDonations/cubit/cubit.dart';
import 'package:hemo_cell/admin/detailsOfDonations/cubit/states.dart';
import 'package:hemo_cell/admin/detailsOfDonations/eventDonation/rejectedEventDonation%20copy/rejected_event_donation1.dart';
import 'package:hemo_cell/admin/detailsOfDonations/eventDonation/waitingEventDonation/waiting_event_screen.dart';
import 'package:hemo_cell/shared/components/components.dart';
import 'package:hemo_cell/shared/components/constants.dart';
import 'package:intl/intl.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class DeatilsDonationViaEvent extends StatelessWidget {
  const DeatilsDonationViaEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<DetailsCubit, DetailsDonationsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = DetailsCubit.get(context);
            return Container(
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
                          'Details of donations via evnets',
                          style: GoogleFonts.bangers(
                            fontSize: 24,
                            color: mainColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            mainColor,
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 15,
                            left: 20,
                            child: Text(
                              'Completed',
                              style: GoogleFonts.lato(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            bottom: 5,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          completeDonation1()));
                                },
                                icon: Icon(
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
                    padding: const EdgeInsets.only(top: 0, right: 20, left: 20),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            mainColor,
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 15,
                            left: 20,
                            child: Text(
                              'Waiting',
                              style: GoogleFonts.lato(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            bottom: 5,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          WaitingEventDonation()));
                                },
                                icon: Icon(
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
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            mainColor,
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 15,
                            left: 20,
                            child: Text(
                              'Rejected',
                              style: GoogleFonts.lato(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            bottom: 5,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          RejectepDonation()));
                                },
                                icon: Icon(
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
            );
          }),
    );
  }
}
