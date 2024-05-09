import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/modules/donate/cubit/cubit.dart';
import 'package:hemo_cell/modules/donate/cubit/states.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:hemo_cell/layout/hemo_cell_layout.dart';

import '../../../shared/components/components.dart';
import '../ourPlace/our_place_screen.dart';

class SpecificDonateScreen extends StatelessWidget {
  SpecificDonateScreen({super.key});
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
  var donateBloodBeforeController = TextEditingController();
  var donateBloodBeforePeriodController = TextEditingController();
  var chronicDiseasesAnswerController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DonateCubit, DonateBloodStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0, top: 20),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.chevron_left,
                                  size: 32,
                                  color: mainColor,
                                )),
                            Text(
                              'Donate Now',
                              style: GoogleFonts.bangers(
                                fontSize: 24,
                                color: mainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enter your name',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: mainColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name must not empty";
                                }
                                return null;
                              },
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: mainColor, width: 2)),
                                filled: true,
                                fillColor: Colors.white.withOpacity(1),
                                prefixIcon: Icon(
                                  Icons.text_format,
                                  color: mainColor,
                                ),
                                hintText: "Name",
                                hintStyle: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enter your age',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: mainColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Age must not empty";
                                }
                                return null;
                              },
                              controller: ageController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: mainColor, width: 2)),
                                filled: true,
                                fillColor: Colors.white.withOpacity(1),
                                prefixIcon: Icon(
                                  Icons.onetwothree_rounded,
                                  color: mainColor,
                                ),
                                hintText: "Age",
                                hintStyle: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enter your gender',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: mainColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null ||
                                    !(value.toLowerCase() == 'male' ||
                                        value.toLowerCase() == 'female')) {
                                  return 'Gender must be either "male" or "female".';
                                }
                                return null;
                              },
                              controller: genderController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: mainColor, width: 2)),
                                filled: true,
                                fillColor: Colors.white.withOpacity(1),
                                helperText:
                                    'Gender must be male or female only',
                                prefixIcon: Icon(
                                  Icons.transgender,
                                  color: mainColor,
                                ),
                                hintText: "Gender",
                                hintStyle: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Are you donated blood before ?',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: mainColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null ||
                                    !(value.toLowerCase() == 'yes' ||
                                        value.toLowerCase() == 'no')) {
                                  return 'Answer must be either "yes" or "no".';
                                }
                                return null;
                              },
                              controller: donateBloodBeforeController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: mainColor, width: 2)),
                                filled: true,
                                fillColor: Colors.white.withOpacity(1),
                                helperText:
                                    'Answer must be either "yes" or "no".',
                                prefixIcon: Icon(
                                  Icons.bloodtype_outlined,
                                  color: mainColor,
                                ),
                                hintText: "Donated blood before",
                                hintStyle: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Do you suffer from any chronic diseases?\nIf answer is yes you will check you when you visit us in our places and give you the decision if you can donate or no.',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: mainColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null ||
                                    !(value.toLowerCase() == 'yes' ||
                                        value.toLowerCase() == 'no')) {
                                  return 'Answer must be either "yes" or "no".';
                                }
                                return null;
                              },
                              controller: chronicDiseasesAnswerController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: mainColor, width: 2)),
                                filled: true,
                                fillColor: Colors.white.withOpacity(1),
                                helperText:
                                    'Answer must be either "yes" or "no".',
                                prefixIcon: Icon(
                                  Icons.medical_information_outlined,
                                  color: mainColor,
                                ),
                                hintText:
                                    "Do you suffer from any chronic diseases?",
                                hintStyle: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'If you have donated before, enter the number of how many weeks ago you donated',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: mainColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                int donationPeriod;

                                try {
                                  donationPeriod = int.parse(value!);
                                } catch (e) {
                                  return 'Please enter a valid integer number.';
                                }

                                // Check if the period is within the allowed range for donation
                                if (donationPeriod >= 4) {
                                  return null; // Value is valid
                                } else if (donationPeriod < 2) {
                                  int remainingDays = 2 - donationPeriod;
                                  return 'Donation is not allowed. Please wait for an additional $remainingDays week(s).';
                                }
                              },
                              controller: donateBloodBeforePeriodController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: mainColor, width: 2)),
                                filled: true,
                                fillColor: Colors.white.withOpacity(1),
                                helperText: 'Answer must be number only ex:"1"',
                                prefixIcon: Icon(
                                  CupertinoIcons.clock,
                                  color: mainColor,
                                ),
                                hintText: "Period of donated blood before",
                                hintStyle: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: mainColor,
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                DonateCubit.get(context).addDonation(
                                  nameController.text,
                                  int.parse(ageController.text),
                                  genderController.text,
                                  donateBloodBeforeController.text,
                                  chronicDiseasesAnswerController.text,
                                  int.parse(
                                      donateBloodBeforePeriodController.text),
                                );
                                PanaraInfoDialog.showAnimatedShrink(
                                  context,
                                  color: mainColor,
                                  message:
                                      'Thank you for donating and using our app\n\nYour donation will be placed for twenty-four hours on our system. The donation will be confirmed when you are in any of our locations, but if twenty-four hours have passed since the donation request, the donation will be considered void.',
                                  noImage: false,
                                  panaraDialogType: PanaraDialogType.custom,
                                  buttonText: 'Okay',
                                  onTapDismiss: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HemoCellLayout()),
                                        (route) => false);
                                  },
                                );
                              }
                            },
                            child: Text(
                              'Donate Now',
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
