import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/layout/cubit/cubit.dart';
import 'package:hemo_cell/shared/components/components.dart';
import 'package:intl/intl.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../../layout/cubit/states.dart';
import '../../shared/components/constants.dart';

class MyDonationsScreen extends StatelessWidget {
  const MyDonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<MainCubit, DonationStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = MainCubit.get(context);
              if (cubit.indexOfChangePages == 1) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
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
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator(
                              color: Colors.black,
                            ));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            String formatTimestamp(Timestamp timestamp) {
                              DateTime dateTime = timestamp.toDate().toLocal();
                              var formatter =
                                  DateFormat('MMMM dd, yyyy h:mm a');

                              return formatter.format(dateTime);
                            }

                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 5, bottom: 20),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.chevron_left,
                                          color: mainColor,
                                          size: 32,
                                        ),
                                      ),
                                      Text(
                                        'My Donations',
                                        style: GoogleFonts.bangers(
                                          fontWeight: FontWeight.bold,
                                          color: mainColor,
                                          fontSize: 24,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 0,
                                  ),
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.black),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              cubit.ChangeOfIndexOfPages1();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      cubit.indexOfChangePages ==
                                                              1
                                                          ? mainColor
                                                          : Colors.black,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  50),
                                                          topLeft:
                                                              Radius.circular(
                                                                  50))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Event Donations',
                                                      style: GoogleFonts.lato(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              cubit.ChangeOfIndexOfPages2();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    cubit.indexOfChangePages ==
                                                            2
                                                        ? mainColor
                                                        : Colors.black,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Blood Donations',
                                                      style: GoogleFonts.lato(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              cubit.ChangeOfIndexOfPages3();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      cubit.indexOfChangePages ==
                                                              3
                                                          ? mainColor
                                                          : Colors.black,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  50),
                                                          topRight:
                                                              Radius.circular(
                                                                  50))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Need Blood',
                                                      style: GoogleFonts.lato(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                cubit.indexOfChangePages == 1 &&
                                        snapshot.data?['listOfBloodByEvent']
                                                .length >
                                            0
                                    ? Expanded(
                                        child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            Timestamp timestamp =
                                                data?['listOfBloodByEvent']
                                                    [index]['timestampOfBegin'];
                                            DateTime dateTime =
                                                timestamp.toDate().toLocal();
                                            DateTime now = DateTime.now();
                                            var difference =
                                                now.difference(dateTime);

                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20, top: 20),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.black,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: mainColor,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'Status',
                                                            style: GoogleFonts
                                                                .bangers(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          if (difference.inHours >
                                                                      24 &&
                                                                  data?['listOfBloodByEvent']
                                                                              [
                                                                              index]
                                                                          [
                                                                          'isDone'] ==
                                                                      false ||
                                                              data?['listOfBloodByEvent']
                                                                          [
                                                                          index]
                                                                      [
                                                                      'isDone'] ==
                                                                  false)
                                                            InkWell(
                                                              onTap: () {
                                                                PanaraInfoDialog.showAnimatedFromBottom(
                                                                    context,
                                                                    color:
                                                                        mainColor,
                                                                    message:
                                                                        'The time available for donation has expired, so your donation has been considered void because you did not go to one of our places to donate.\n\nThank you and you can try again.',
                                                                    buttonText:
                                                                        'Ok',
                                                                    onTapDismiss:
                                                                        () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                    panaraDialogType:
                                                                        PanaraDialogType
                                                                            .custom,
                                                                    noImage:
                                                                        false);
                                                              },
                                                              child: Container(
                                                                height: 25,
                                                                width: 100,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .white),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 7,
                                                                      right: 7,
                                                                      top: 2,
                                                                      bottom:
                                                                          2),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Time is over',
                                                                        style: GoogleFonts.lato(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .circle,
                                                                        size:
                                                                            12,
                                                                        color:
                                                                            mainColor,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (difference
                                                                      .inHours <
                                                                  24 &&
                                                              data?['listOfBloodByEvent']
                                                                          [
                                                                          index]
                                                                      [
                                                                      'isDone'] ==
                                                                  null)
                                                            InkWell(
                                                              onTap: () {
                                                                PanaraInfoDialog.showAnimatedFromBottom(
                                                                    context,
                                                                    color: Colors
                                                                        .amber,
                                                                    message:
                                                                        'You still have time to donate your request. You can go to one of the places to donate before 24 hours have passed since the request.',
                                                                    buttonText:
                                                                        'Ok',
                                                                    onTapDismiss:
                                                                        () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                    panaraDialogType:
                                                                        PanaraDialogType
                                                                            .warning,
                                                                    noImage:
                                                                        false);
                                                              },
                                                              child: Container(
                                                                height: 25,
                                                                width: 90,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .white),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 7,
                                                                      right: 7,
                                                                      top: 2,
                                                                      bottom:
                                                                          2),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        'Waiting',
                                                                        style: GoogleFonts.lato(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .circle,
                                                                        size:
                                                                            12,
                                                                        color: Colors
                                                                            .amber,
                                                                      )
                                                                    ],
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (data?['listOfBloodByEvent']
                                                                      [index]
                                                                  ['isDone'] ==
                                                              true)
                                                            InkWell(
                                                              onTap: () {
                                                                PanaraInfoDialog.showAnimatedFromBottom(
                                                                    context,
                                                                    color: Colors
                                                                        .green,
                                                                    message:
                                                                        'Thank you for your donation. The donation was successful. We thank you for your kind cooperation with us and we hope that you will continue with us on the journey of giving.',
                                                                    buttonText:
                                                                        'Ok',
                                                                    onTapDismiss:
                                                                        () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                    panaraDialogType:
                                                                        PanaraDialogType
                                                                            .success,
                                                                    noImage:
                                                                        false);
                                                              },
                                                              child: Container(
                                                                height: 25,
                                                                width: 150,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .white),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 7,
                                                                      right: 7,
                                                                      top: 2,
                                                                      bottom:
                                                                          2),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        'Donate successfully',
                                                                        style: GoogleFonts.lato(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .circle,
                                                                        size:
                                                                            12,
                                                                        color: Colors
                                                                            .green,
                                                                      )
                                                                    ],
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              top: 10,
                                                              right: 10),
                                                      child: Text(
                                                        data?['listOfBloodByEvent']
                                                                [index]
                                                            ['nameOfEvent'],
                                                        style: GoogleFonts.lato(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              top: 10,
                                                              right: 10,
                                                              bottom: 10),
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
                                                                data?['listOfBloodByEvent']
                                                                        [index][
                                                                    'timestampOfBegin']),
                                                            style: GoogleFonts
                                                                .lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount: data?['listOfBloodByEvent']
                                              .length,
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 300,
                                            left: 25,
                                            right: 25,
                                            bottom: 10),
                                        child: Center(
                                          child: Text(
                                              textAlign: TextAlign.center,
                                              'You have not yet donated, dear user, via the events.',
                                              style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: mainColor,
                                              )),
                                        ),
                                      )
                              ],
                            );
                          }
                        }));
              } else if (cubit.indexOfChangePages == 2) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
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
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator(
                              color: Colors.black,
                            ));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            String formatTimestamp(Timestamp timestamp) {
                              DateTime dateTime = timestamp.toDate().toLocal();
                              var formatter =
                                  DateFormat('MMMM dd, yyyy h:mm a');

                              return formatter.format(dateTime);
                            }

                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 5, bottom: 20),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.chevron_left,
                                          color: mainColor,
                                          size: 32,
                                        ),
                                      ),
                                      Text(
                                        'My Donations',
                                        style: GoogleFonts.bangers(
                                          fontWeight: FontWeight.bold,
                                          color: mainColor,
                                          fontSize: 24,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 0,
                                  ),
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.black),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              cubit.ChangeOfIndexOfPages1();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      cubit.indexOfChangePages ==
                                                              1
                                                          ? mainColor
                                                          : Colors.black,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  50),
                                                          topLeft:
                                                              Radius.circular(
                                                                  50))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Event Donations',
                                                      style: GoogleFonts.lato(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              cubit.ChangeOfIndexOfPages2();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    cubit.indexOfChangePages ==
                                                            2
                                                        ? mainColor
                                                        : Colors.black,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Blood Donations',
                                                      style: GoogleFonts.lato(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              cubit.ChangeOfIndexOfPages3();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      cubit.indexOfChangePages ==
                                                              3
                                                          ? mainColor
                                                          : Colors.black,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  50),
                                                          topRight:
                                                              Radius.circular(
                                                                  50))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Need Blood',
                                                      style: GoogleFonts.lato(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                cubit.indexOfChangePages == 2 &&
                                        snapshot.data?['listOfDonations']
                                                .length >
                                            0
                                    ? Expanded(
                                        child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            Timestamp timestamp =
                                                data?['listOfDonations'][index]
                                                    ['timestampOfBegin'];
                                            DateTime dateTime =
                                                timestamp.toDate().toLocal();
                                            DateTime now = DateTime.now();
                                            var difference =
                                                now.difference(dateTime);

                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20, top: 20),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.black,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: mainColor,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'Status',
                                                            style: GoogleFonts
                                                                .bangers(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          if (difference.inHours >
                                                                      24 &&
                                                                  data?['listOfDonations']
                                                                              [index]
                                                                          [
                                                                          'isDone'] ==
                                                                      false ||
                                                              difference.inHours >
                                                                      24 &&
                                                                  data?['listOfDonations']
                                                                              [
                                                                              index]
                                                                          [
                                                                          'isDone'] ==
                                                                      null ||
                                                              data?['listOfDonations']
                                                                          [
                                                                          index]
                                                                      [
                                                                      'isDone'] ==
                                                                  false)
                                                            InkWell(
                                                              onTap: () {
                                                                PanaraInfoDialog.showAnimatedFromBottom(
                                                                    context,
                                                                    color:
                                                                        mainColor,
                                                                    message:
                                                                        'The time available for donation has expired, so your donation has been considered void because you did not go to one of our places to donate.\n\nThank you and you can try again.',
                                                                    buttonText:
                                                                        'Ok',
                                                                    onTapDismiss:
                                                                        () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                    panaraDialogType:
                                                                        PanaraDialogType
                                                                            .custom,
                                                                    noImage:
                                                                        false);
                                                              },
                                                              child: Container(
                                                                height: 25,
                                                                width: 100,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .white),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 7,
                                                                      right: 7,
                                                                      top: 2,
                                                                      bottom:
                                                                          2),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Time is over',
                                                                        style: GoogleFonts.lato(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .circle,
                                                                        size:
                                                                            12,
                                                                        color:
                                                                            mainColor,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (difference
                                                                      .inHours <
                                                                  24 &&
                                                              data?['listOfDonations']
                                                                          [
                                                                          index]
                                                                      [
                                                                      'isDone'] ==
                                                                  null)
                                                            InkWell(
                                                              onTap: () {
                                                                PanaraInfoDialog.showAnimatedFromBottom(
                                                                    context,
                                                                    color: Colors
                                                                        .amber,
                                                                    message:
                                                                        'You still have time to donate your request. You can go to one of the places to donate before 24 hours have passed since the request.',
                                                                    buttonText:
                                                                        'Ok',
                                                                    onTapDismiss:
                                                                        () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                    panaraDialogType:
                                                                        PanaraDialogType
                                                                            .warning,
                                                                    noImage:
                                                                        false);
                                                              },
                                                              child: Container(
                                                                height: 25,
                                                                width: 90,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .white),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 7,
                                                                      right: 7,
                                                                      top: 2,
                                                                      bottom:
                                                                          2),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        'Waiting',
                                                                        style: GoogleFonts.lato(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .circle,
                                                                        size:
                                                                            12,
                                                                        color: Colors
                                                                            .amber,
                                                                      )
                                                                    ],
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (data?['listOfDonations']
                                                                      [index]
                                                                  ['isDone'] ==
                                                              true)
                                                            InkWell(
                                                              onTap: () {
                                                                PanaraInfoDialog.showAnimatedFromBottom(
                                                                    context,
                                                                    color: Colors
                                                                        .amber,
                                                                    message:
                                                                        'Thank you for your donation. The donation was successful. We thank you for your kind cooperation with us and we hope that you will continue with us on the journey of giving.',
                                                                    buttonText:
                                                                        'Ok',
                                                                    onTapDismiss:
                                                                        () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                    panaraDialogType:
                                                                        PanaraDialogType
                                                                            .success,
                                                                    noImage:
                                                                        false);
                                                              },
                                                              child: Container(
                                                                height: 25,
                                                                width: 150,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .white),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 7,
                                                                      right: 7,
                                                                      top: 2,
                                                                      bottom:
                                                                          2),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        'Donate successfully',
                                                                        style: GoogleFonts.lato(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .circle,
                                                                        size:
                                                                            12,
                                                                        color: Colors
                                                                            .green,
                                                                      )
                                                                    ],
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10,
                                                          top: 10,
                                                          right: 10),
                                                      child: Text(
                                                        "Donation-${index + 1}",
                                                        style: GoogleFonts.lato(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              top: 10,
                                                              right: 10,
                                                              bottom: 10),
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
                                                                data?['listOfDonations']
                                                                        [index][
                                                                    'timestampOfBegin']),
                                                            style: GoogleFonts
                                                                .lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              data?['listOfDonations'].length,
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 220,
                                            left: 25,
                                            right: 25,
                                            bottom: 10),
                                        child: Center(
                                          child: Text(
                                              textAlign: TextAlign.center,
                                              'You have not yet donated',
                                              style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: mainColor,
                                              )),
                                        ),
                                      )
                              ],
                            );
                          }
                        }));
              } else {
                return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
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
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator(
                              color: Colors.black,
                            ));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            String formatTimestamp(Timestamp timestamp) {
                              DateTime dateTime = timestamp.toDate().toLocal();
                              var formatter =
                                  DateFormat('MMMM dd, yyyy h:mm a');

                              return formatter.format(dateTime);
                            }

                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 5, bottom: 20),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.chevron_left,
                                          color: mainColor,
                                          size: 32,
                                        ),
                                      ),
                                      Text(
                                        'My Donations',
                                        style: GoogleFonts.bangers(
                                          fontWeight: FontWeight.bold,
                                          color: mainColor,
                                          fontSize: 24,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 0,
                                  ),
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.black),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              cubit.ChangeOfIndexOfPages1();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      cubit.indexOfChangePages ==
                                                              1
                                                          ? mainColor
                                                          : Colors.black,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  50),
                                                          topLeft:
                                                              Radius.circular(
                                                                  50))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Event Donations',
                                                      style: GoogleFonts.lato(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              cubit.ChangeOfIndexOfPages2();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    cubit.indexOfChangePages ==
                                                            2
                                                        ? mainColor
                                                        : Colors.black,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Blood Donations',
                                                      style: GoogleFonts.lato(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              cubit.ChangeOfIndexOfPages3();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      cubit.indexOfChangePages ==
                                                              3
                                                          ? mainColor
                                                          : Colors.black,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  50),
                                                          topRight:
                                                              Radius.circular(
                                                                  50))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Need Blood',
                                                      style: GoogleFonts.lato(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                cubit.indexOfChangePages == 3 &&
                                        snapshot.data?['listOfBloodBags']
                                                .length >
                                            0
                                    ? Expanded(
                                        child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            Timestamp timestamp =
                                                data?['listOfBloodBags'][index]
                                                    ['timestampOfBegin'];
                                            DateTime dateTime =
                                                timestamp.toDate().toLocal();
                                            DateTime now = DateTime.now();
                                            var difference =
                                                now.difference(dateTime);

                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20, top: 20),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.black,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: mainColor,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'Status',
                                                            style: GoogleFonts
                                                                .bangers(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          if (difference
                                                                      .inHours >
                                                                  24 &&
                                                              data?['listOfBloodBags']
                                                                          [
                                                                          index]
                                                                      [
                                                                      'isDone'] ==
                                                                  null)
                                                            InkWell(
                                                              onTap: () {
                                                                PanaraInfoDialog.showAnimatedFromBottom(
                                                                    context,
                                                                    color:
                                                                        mainColor,
                                                                    message:
                                                                        'The time available for donation has expired, so your donation has been considered void because you did not go to one of our places to donate.\n\nThank you and you can try again.',
                                                                    buttonText:
                                                                        'Ok',
                                                                    onTapDismiss:
                                                                        () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                    panaraDialogType:
                                                                        PanaraDialogType
                                                                            .custom,
                                                                    noImage:
                                                                        false);
                                                              },
                                                              child: Container(
                                                                height: 25,
                                                                width: 90,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .white),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 7,
                                                                      right: 7,
                                                                      top: 2,
                                                                      bottom:
                                                                          2),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Time is over',
                                                                        style: GoogleFonts.lato(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .circle,
                                                                        size:
                                                                            12,
                                                                        color:
                                                                            mainColor,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (difference
                                                                  .inHours <
                                                              24)
                                                            InkWell(
                                                              onTap: () {
                                                                PanaraInfoDialog.showAnimatedFromBottom(
                                                                    context,
                                                                    color: Colors
                                                                        .amber,
                                                                    message:
                                                                        'You still have time to donate your request. You can go to one of the places to donate before 24 hours have passed since the request.',
                                                                    buttonText:
                                                                        'Ok',
                                                                    onTapDismiss:
                                                                        () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                    panaraDialogType:
                                                                        PanaraDialogType
                                                                            .warning,
                                                                    noImage:
                                                                        false);
                                                              },
                                                              child: Container(
                                                                height: 25,
                                                                width: 90,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .white),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 7,
                                                                      right: 7,
                                                                      top: 2,
                                                                      bottom:
                                                                          2),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        'Waiting',
                                                                        style: GoogleFonts.lato(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .circle,
                                                                        size:
                                                                            12,
                                                                        color: Colors
                                                                            .amber,
                                                                      )
                                                                    ],
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (data?['listOfBloodBags']
                                                                      [index]
                                                                  ['isDone'] ==
                                                              true)
                                                            InkWell(
                                                              onTap: () {
                                                                PanaraInfoDialog.showAnimatedFromBottom(
                                                                    context,
                                                                    color: Colors
                                                                        .amber,
                                                                    message:
                                                                        'Thank you for your donation. The donation was successful. We thank you for your kind cooperation with us and we hope that you will continue with us on the journey of giving.',
                                                                    buttonText:
                                                                        'Ok',
                                                                    onTapDismiss:
                                                                        () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                    panaraDialogType:
                                                                        PanaraDialogType
                                                                            .success,
                                                                    noImage:
                                                                        false);
                                                              },
                                                              child: Container(
                                                                height: 25,
                                                                width: 150,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .white),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 7,
                                                                      right: 7,
                                                                      top: 2,
                                                                      bottom:
                                                                          2),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        'Donate successfully',
                                                                        style: GoogleFonts.lato(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .circle,
                                                                        size:
                                                                            12,
                                                                        color: Colors
                                                                            .green,
                                                                      )
                                                                    ],
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              top: 10,
                                                              right: 10),
                                                      child: Text(
                                                        data?['listOfBloodBags']
                                                                [index]
                                                            ['nameOfPlace'],
                                                        style: GoogleFonts.lato(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              top: 10,
                                                              right: 10,
                                                              bottom: 10),
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
                                                                data?['listOfBloodBags']
                                                                        [index][
                                                                    'timestampOfBegin']),
                                                            style: GoogleFonts
                                                                .lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            data?['listOfBloodBags']
                                                                    [index]
                                                                ['typeOfBlood'],
                                                            style: GoogleFonts
                                                                .bangers(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: mainColor,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              data?['listOfBloodBags'].length,
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 250,
                                            left: 25,
                                            right: 25,
                                            bottom: 10),
                                        child: Center(
                                          child: Text(
                                              textAlign: TextAlign.center,
                                              'You have not order any blood bags yet.',
                                              style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: mainColor,
                                              )),
                                        ),
                                      )
                              ],
                            );
                          }
                        }));
              }
            }));
  }
}
