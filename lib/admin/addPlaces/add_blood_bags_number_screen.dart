import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/admin/addPlaces/add_name_of_place_screen.dart';
import 'package:hemo_cell/admin/addPlaces/finish_screen.dart';
import 'package:hemo_cell/admin/cubit/cubit.dart';
import 'package:hemo_cell/admin/cubit/states.dart';
import 'package:hemo_cell/shared/components/components.dart';

class AddBloodBagsNumberScreen extends StatelessWidget {
  final nameOfPlace;
  AddBloodBagsNumberScreen(this.nameOfPlace);

  @override
  Widget build(BuildContext context) {
    var aPositive = TextEditingController();
    var aNegative = TextEditingController();
    var bPositive = TextEditingController();
    var bNegative = TextEditingController();
    var abPositive = TextEditingController();
    var abNegative = TextEditingController();
    var oPositive = TextEditingController();
    var oNegative = TextEditingController();

    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        if (state is DoneAddInfoSuccessState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => FinishScreenToAddPlace()),
              (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.chevron_left,
                                    size: 32,
                                    color: mainColor,
                                  )),
                              Text(
                                'Add number of blood bags',
                                style: GoogleFonts.bangers(
                                    color: mainColor, fontSize: 24),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: Text(
                            'Enter number of blood bags for A+ type',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: mainColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: TextFormField(
                            validator: (value) {
                              try {
                                int.parse(value!);
                                return null; // Return null if parsing succeeds (input is an integer)
                              } catch (e) {
                                return 'Please enter a valid integer number.';
                              }
                            },
                            controller: aPositive,
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
                              prefixIcon: Icon(
                                Icons.troubleshoot,
                                color: mainColor,
                              ),
                              hintText: "Number of A+ blood bags",
                              hintStyle: GoogleFonts.lato(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: Text(
                            'Enter number of blood bags for A- type',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: mainColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: TextFormField(
                            validator: (value) {
                              try {
                                int.parse(value!);
                                return null; // Return null if parsing succeeds (input is an integer)
                              } catch (e) {
                                return 'Please enter a valid integer number.';
                              }
                            },
                            controller: aNegative,
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
                              prefixIcon: Icon(
                                Icons.troubleshoot,
                                color: mainColor,
                              ),
                              hintText: "Number of A- blood bags",
                              hintStyle: GoogleFonts.lato(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: Text(
                            'Enter number of blood bags for B+ type',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: mainColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: TextFormField(
                            validator: (value) {
                              try {
                                int.parse(value!);
                                return null; // Return null if parsing succeeds (input is an integer)
                              } catch (e) {
                                return 'Please enter a valid integer number.';
                              }
                            },
                            controller: bPositive,
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
                              prefixIcon: Icon(
                                Icons.troubleshoot,
                                color: mainColor,
                              ),
                              hintText: "Number of B+ blood bags",
                              hintStyle: GoogleFonts.lato(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: Text(
                            'Enter number of blood bags for B- type',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: mainColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: TextFormField(
                            validator: (value) {
                              try {
                                int.parse(value!);
                                return null; // Return null if parsing succeeds (input is an integer)
                              } catch (e) {
                                return 'Please enter a valid integer number.';
                              }
                            },
                            controller: bNegative,
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
                              prefixIcon: Icon(
                                Icons.troubleshoot,
                                color: mainColor,
                              ),
                              hintText: "Number of B- blood bags",
                              hintStyle: GoogleFonts.lato(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: Text(
                            'Enter number of blood bags for AB+ type',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: mainColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: TextFormField(
                            validator: (value) {
                              try {
                                int.parse(value!);
                                return null; // Return null if parsing succeeds (input is an integer)
                              } catch (e) {
                                return 'Please enter a valid integer number.';
                              }
                            },
                            controller: abPositive,
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
                              prefixIcon: Icon(
                                Icons.troubleshoot,
                                color: mainColor,
                              ),
                              hintText: "Number of AB+ blood bags",
                              hintStyle: GoogleFonts.lato(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: Text(
                            'Enter number of blood bags for AB- type',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: mainColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: TextFormField(
                            validator: (value) {
                              try {
                                int.parse(value!);
                                return null; // Return null if parsing succeeds (input is an integer)
                              } catch (e) {
                                return 'Please enter a valid integer number.';
                              }
                            },
                            controller: abNegative,
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
                              prefixIcon: Icon(
                                Icons.troubleshoot,
                                color: mainColor,
                              ),
                              hintText: "Number of O+ blood bags",
                              hintStyle: GoogleFonts.lato(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: Text(
                            'Enter number of blood bags for O+ type',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: mainColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: TextFormField(
                            validator: (value) {
                              try {
                                int.parse(value!);
                                return null; // Return null if parsing succeeds (input is an integer)
                              } catch (e) {
                                return 'Please enter a valid integer number.';
                              }
                            },
                            controller: oPositive,
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
                              prefixIcon: Icon(
                                Icons.troubleshoot,
                                color: mainColor,
                              ),
                              hintText: "Number of O+ blood bags",
                              hintStyle: GoogleFonts.lato(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: Text(
                            'Enter number of blood bags for O- type',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: mainColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 30),
                          child: TextFormField(
                            validator: (value) {
                              try {
                                int.parse(value!);
                                return null; // Return null if parsing succeeds (input is an integer)
                              } catch (e) {
                                return 'Please enter a valid integer number.';
                              }
                            },
                            controller: oNegative,
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
                              prefixIcon: Icon(
                                Icons.troubleshoot,
                                color: mainColor,
                              ),
                              hintText: "Number of O- blood bags",
                              hintStyle: GoogleFonts.lato(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 40),
                          child: InkWell(
                            child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Next',
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                // AdminCubit.get(context).addPercentageOfEvent(nameOfEvent, percentageController.text);
                                // AdminCubit.get(context).addDetailsOfEvent(nameOfEvent, detailsController.text);
                                // AdminCubit.get(context).addTargetOfEvent(nameOfEvent, targetController.text);
                                AdminCubit.get(context).updateBloodBags(
                                    nameOfPlace,
                                    int.parse(aPositive.text),
                                    int.parse(aNegative.text),
                                    int.parse(bPositive.text),
                                    int.parse(bNegative.text),
                                    int.parse(abPositive.text),
                                    int.parse(abNegative.text),
                                    int.parse(oPositive.text),
                                    int.parse(oNegative.text));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            ));
      },
    );
  }
}
