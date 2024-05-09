import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/layout/hemo_cell_layout.dart';
import 'package:hemo_cell/modules/needBlood/cubit/cubit.dart';
import 'package:hemo_cell/modules/needBlood/cubit/states.dart';
import 'package:hemo_cell/shared/components/constants.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../../../shared/components/components.dart';

class SpecificPlaceBloodScreen extends StatelessWidget {
  var bloodSampleController = TextEditingController();
  var numberOfBloodBags = TextEditingController();
  var genderController = TextEditingController();
  var donateBloodBeforeController = TextEditingController();
  var donateBloodBeforePeriodController = TextEditingController();
  var chronicDiseasesAnswerController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final data;
  SpecificPlaceBloodScreen(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<NeedBloodCubit, NeedBloodStates>(
        listener: (context, state) {
          if (state is DonateByEventSuccessfullyState) {
            PanaraInfoDialog.showAnimatedGrow(context,
                message:
                    "Your request has been registered successfully. You can visit us at any time to inspect and ensure that you are worthy of that donation.\nNote: After 24 hours of submitting your order, it will be considered invalid",
                buttonText: 'Ok', onTapDismiss: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HemoCellLayout()),
                  (route) => false);
            }, panaraDialogType: PanaraDialogType.success);
          }
        },
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                          '${data?['nameOfPlace']}',
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
                        left: 20, right: 20, top: 20, bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: mainColor,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15,
                                  top: 5,
                                  child: Text(
                                    'A-',
                                    style: GoogleFonts.bangers(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 1,
                                  child: Center(
                                    child: Text(
                                      '${data?['A-']}',
                                      style: GoogleFonts.bangers(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: mainColor,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15,
                                  top: 5,
                                  child: Text(
                                    'A+',
                                    style: GoogleFonts.bangers(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 1,
                                  child: Center(
                                    child: Text(
                                      '${data?['A+']}',
                                      style: GoogleFonts.bangers(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: mainColor,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15,
                                  top: 5,
                                  child: Text(
                                    'B-',
                                    style: GoogleFonts.bangers(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 1,
                                  child: Center(
                                    child: Text(
                                      '${data?['B-']}',
                                      style: GoogleFonts.bangers(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: mainColor,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15,
                                  top: 5,
                                  child: Text(
                                    'B+',
                                    style: GoogleFonts.bangers(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 1,
                                  child: Center(
                                    child: Text(
                                      '${data?['B+']}',
                                      style: GoogleFonts.bangers(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: mainColor,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15,
                                  top: 5,
                                  child: Text(
                                    'AB+',
                                    style: GoogleFonts.bangers(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 1,
                                  child: Center(
                                    child: Text(
                                      '${data?['AB+']}',
                                      style: GoogleFonts.bangers(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: mainColor,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15,
                                  top: 5,
                                  child: Text(
                                    'AB-',
                                    style: GoogleFonts.bangers(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 1,
                                  child: Center(
                                    child: Text(
                                      '${data?['AB-']}',
                                      style: GoogleFonts.bangers(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: mainColor,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15,
                                  top: 5,
                                  child: Text(
                                    'O+',
                                    style: GoogleFonts.bangers(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 1,
                                  child: Center(
                                    child: Text(
                                      '${data?['O+']}',
                                      style: GoogleFonts.bangers(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: mainColor,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15,
                                  top: 5,
                                  child: Text(
                                    'O-',
                                    style: GoogleFonts.bangers(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 1,
                                  child: Center(
                                    child: Text(
                                      '${data?['O-']}',
                                      style: GoogleFonts.bangers(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
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
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enter the type of blood sample you need\nMust be from the previous samples.',
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
                                  bool validateBloodType(String value) {
                                    List<String> validBloodTypes = [
                                      'A+',
                                      'A-',
                                      'B+',
                                      'B-',
                                      'AB+',
                                      'AB-',
                                      'O+',
                                      'O-'
                                    ];

                                    return validBloodTypes.contains(value);
                                  }

                                  if (value!.isEmpty) {
                                    return 'Please enter a blood type.';
                                  } else if (!validateBloodType(value)) {
                                    return 'Invalid blood type. Please enter a valid blood type (e.g., A+, B-, AB+).';
                                  }
                                  return null;
                                },
                                controller: bloodSampleController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 1)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: mainColor, width: 2)),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(1),
                                  prefixIcon: Icon(
                                    Icons.bloodtype_outlined,
                                    color: mainColor,
                                  ),
                                  hintText: "Type of sample blood",
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enter number of blood bags that you need',
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
                                    return "Number of blood bags must not empty";
                                  }
                                  return null;
                                },
                                controller: numberOfBloodBags,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 1)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: mainColor, width: 2)),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(1),
                                  prefixIcon: Icon(
                                    Icons.onetwothree_rounded,
                                    color: mainColor,
                                  ),
                                  hintText: "Number of blood bags",
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
                                  if (bloodSampleController.text == 'A+') {
                                    if (int.parse(numberOfBloodBags.text) >
                                            data?['A+'] &&
                                        int.parse(numberOfBloodBags.text) > 0) {
                                      PanaraInfoDialog.showAnimatedFromTop(
                                          context,
                                          color: mainColor,
                                          message:
                                              'The avilable amount of A+ sample = ${data['A+']}',
                                          buttonText: 'Ok', onTapDismiss: () {
                                        Navigator.pop(context);
                                      },
                                          panaraDialogType:
                                              PanaraDialogType.custom);
                                    } else {
                                      NeedBloodCubit.get(context).needBlood(
                                          data?['nameOfPlace'],
                                          bloodSampleController.text,
                                          int.parse(numberOfBloodBags.text));
                                    }
                                  } else if (bloodSampleController.text ==
                                      'A-') {
                                    if (int.parse(numberOfBloodBags.text) >
                                            data?['A-'] &&
                                        int.parse(numberOfBloodBags.text) > 0) {
                                      PanaraInfoDialog.showAnimatedFromTop(
                                          context,
                                          color: mainColor,
                                          message:
                                              'The avilable amount of A- sample = ${data['A-']}',
                                          buttonText: 'Ok', onTapDismiss: () {
                                        Navigator.pop(context);
                                      },
                                          panaraDialogType:
                                              PanaraDialogType.custom);
                                    } else {
                                      NeedBloodCubit.get(context).needBlood(
                                          data?['nameOfPlace'],
                                          bloodSampleController.text,
                                          int.parse(numberOfBloodBags.text));
                                    }
                                  } else if (bloodSampleController.text ==
                                      'B+') {
                                    if (int.parse(numberOfBloodBags.text) >
                                            data?['B+'] &&
                                        int.parse(numberOfBloodBags.text) > 0) {
                                      PanaraInfoDialog.showAnimatedFromTop(
                                          context,
                                          color: mainColor,
                                          message:
                                              'The avilable amount of B+ sample = ${data['B+']}',
                                          buttonText: 'Ok', onTapDismiss: () {
                                        Navigator.pop(context);
                                      },
                                          panaraDialogType:
                                              PanaraDialogType.custom);
                                    } else {
                                      NeedBloodCubit.get(context).needBlood(
                                          data?['nameOfPlace'],
                                          bloodSampleController.text,
                                          int.parse(numberOfBloodBags.text));
                                    }
                                  } else if (bloodSampleController.text ==
                                      'B-') {
                                    if (int.parse(numberOfBloodBags.text) >
                                            data?['B-'] &&
                                        int.parse(numberOfBloodBags.text) > 0) {
                                      PanaraInfoDialog.showAnimatedFromTop(
                                          context,
                                          color: mainColor,
                                          message:
                                              'The avilable amount of B- sample = ${data['B-']}',
                                          buttonText: 'Ok', onTapDismiss: () {
                                        Navigator.pop(context);
                                      },
                                          panaraDialogType:
                                              PanaraDialogType.custom);
                                    } else {
                                      NeedBloodCubit.get(context).needBlood(
                                          data?['nameOfPlace'],
                                          bloodSampleController.text,
                                          int.parse(numberOfBloodBags.text));
                                    }
                                  } else if (bloodSampleController.text ==
                                      'AB+') {
                                    if (int.parse(numberOfBloodBags.text) >
                                            data?['AB+'] &&
                                        int.parse(numberOfBloodBags.text) > 0) {
                                      PanaraInfoDialog.showAnimatedFromTop(
                                          context,
                                          color: mainColor,
                                          message:
                                              'The avilable amount of AB+ sample = ${data['AB+']}',
                                          buttonText: 'Ok', onTapDismiss: () {
                                        Navigator.pop(context);
                                      },
                                          panaraDialogType:
                                              PanaraDialogType.custom);
                                    } else {
                                      NeedBloodCubit.get(context).needBlood(
                                          data?['nameOfPlace'],
                                          bloodSampleController.text,
                                          int.parse(numberOfBloodBags.text));
                                    }
                                  } else if (bloodSampleController.text ==
                                      'AB-') {
                                    if (int.parse(numberOfBloodBags.text) >
                                            data?['AB-'] &&
                                        int.parse(numberOfBloodBags.text) > 0) {
                                      PanaraInfoDialog.showAnimatedFromTop(
                                          context,
                                          color: mainColor,
                                          message:
                                              'The avilable amount of AB- sample = ${data['AB-']}',
                                          buttonText: 'Ok', onTapDismiss: () {
                                        Navigator.pop(context);
                                      },
                                          panaraDialogType:
                                              PanaraDialogType.custom);
                                    } else {
                                      NeedBloodCubit.get(context).needBlood(
                                          data?['nameOfPlace'],
                                          bloodSampleController.text,
                                          int.parse(numberOfBloodBags.text));
                                    }
                                  } else if (bloodSampleController.text ==
                                      'O+') {
                                    if (int.parse(numberOfBloodBags.text) >
                                            data?['O+'] &&
                                        int.parse(numberOfBloodBags.text) > 0) {
                                      PanaraInfoDialog.showAnimatedFromTop(
                                          context,
                                          color: mainColor,
                                          message:
                                              'The avilable amount of O+ sample = ${data['O+']}',
                                          buttonText: 'Ok', onTapDismiss: () {
                                        Navigator.pop(context);
                                      },
                                          panaraDialogType:
                                              PanaraDialogType.custom);
                                    } else {
                                      NeedBloodCubit.get(context).needBlood(
                                          data?['nameOfPlace'],
                                          bloodSampleController.text,
                                          int.parse(numberOfBloodBags.text));
                                    }
                                  } else if (bloodSampleController.text ==
                                      'O-') {
                                    if (int.parse(numberOfBloodBags.text) >
                                            data?['O-'] &&
                                        int.parse(numberOfBloodBags.text) > 0) {
                                      PanaraInfoDialog.showAnimatedFromTop(
                                          context,
                                          color: mainColor,
                                          message:
                                              'The avilable amount of O+ sample = ${data['O-']}',
                                          buttonText: 'Ok', onTapDismiss: () {
                                        Navigator.pop(context);
                                      },
                                          panaraDialogType:
                                              PanaraDialogType.custom);
                                    } else {
                                      NeedBloodCubit.get(context).needBlood(
                                          data?['nameOfPlace'],
                                          bloodSampleController.text,
                                          int.parse(numberOfBloodBags.text));
                                    }
                                  }
                                }
                              },
                              child: Text(
                                'Order Now',
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
                ],
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
