import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/layout/cubit/cubit.dart';
import 'package:hemo_cell/layout/cubit/states.dart';
import 'package:hemo_cell/modules/login/login_screen.dart';
import 'package:hemo_cell/modules/myDonations/my_donations_screen.dart';
import 'package:hemo_cell/shared/components/constants.dart';

import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, DonationStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          color: Colors.white,
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
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  ));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'Profile',
                            style: GoogleFonts.bangers(
                              fontSize: 32,
                              color: mainColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 20),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              height: 160,
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
                                    left: 10,
                                    bottom: 5,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/logo.png'))),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 10,
                                    right: 50,
                                    bottom: 10,
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${data?['name']}',
                                            style: GoogleFonts.bangers(
                                              fontSize: 24,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 0,
                                          ),
                                          Text(
                                            '${data?['email']}',
                                            style: GoogleFonts.lato(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 20,
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
                          padding: const EdgeInsets.only(
                              left: 25, right: 20, top: 10, bottom: 20),
                          child: Container(
                            height: 100,
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
                                  left: 20,
                                  top: 15,
                                  child: Text(
                                    'My donations',
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyDonationsScreen()));
                                      },
                                      icon: const Icon(
                                        Icons.chevron_right,
                                        color: Colors.white,
                                        size: 32,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  height: 100,
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
                                        left: 20,
                                        top: 10,
                                        right: 20,
                                        bottom: 10,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'You have donated with us a number of times',
                                              style: GoogleFonts.lato(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        right: 20,
                                        bottom: 5,
                                        child: Text(
                                          ' ${data?['numberOfBloodDonations']}',
                                          style: GoogleFonts.bangers(
                                            fontSize: 20,
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
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  height: 100,
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
                                        left: 20,
                                        top: 10,
                                        right: 20,
                                        bottom: 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'We helped you obtain a number of blood bags',
                                              style: GoogleFonts.lato(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        right: 20,
                                        bottom: 5,
                                        child: Text(
                                          ' ${data?['numberOfBloodRecipient']}',
                                          style: GoogleFonts.bangers(
                                            fontSize: 20,
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
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 20, top: 20),
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 20,
                                  top: 15,
                                  child: Text(
                                    'Settings',
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.settings,
                                        size: 32,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 20, top: 20),
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 20,
                                  top: 15,
                                  child: Text(
                                    'Logout',
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: IconButton(
                                      onPressed: () {
                                        CacheHelper.removeData(key: 'userId')
                                            ?.then((value) async {
                                          if (value!) {
                                            await FirebaseAuth.instance
                                                .signOut();
                                            userId = null;
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()),
                                                (route) => false);
                                            MainCubit.get(context)
                                                .currentIndex = 0;
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.logout,
                                        size: 32,
                                        color: Colors.red,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
        );
      },
    );
  }
}
