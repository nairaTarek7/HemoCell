

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/admin/addPlaces/add_blood_bags_number_screen.dart';
import 'package:hemo_cell/admin/addPlaces/add_name_of_place_screen.dart';

import '../../shared/components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class AddDetailsAndHoursOfWorkScreen extends StatelessWidget {
  final nameOfPlace;
  final imageOfPlace;
  AddDetailsAndHoursOfWorkScreen(this.nameOfPlace,this.imageOfPlace);

  @override
  Widget build(BuildContext context) {
    var detailsController = TextEditingController();
    var targetController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AdminCubit,AdminStates>(
      listener: (context,state){
if(state is DoneAddInfoSuccessState)
  {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> AddBloodBagsNumberScreen(nameOfPlace)), (route) => false);
  }
      },
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.white,
          body:SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: formKey,
                child: Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: (){}
                              , icon: Icon(Icons.chevron_left,size: 32,color:mainColor,)
                          ),
                          Text(
                            'Add details of place',
                            style: GoogleFonts.bangers(
                                color:mainColor,
                                fontSize:24
                            ),
                          )
                        ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add Details of place',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: mainColor,

                            ),
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(

                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Details must not empty';
                                }
                                return null;
                              },
                              maxLines:7,
                              controller: detailsController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:  Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                alignLabelWithHint: true,
                                focusedBorder: OutlineInputBorder(

                                  borderSide:
                                   BorderSide(color: mainColor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                label:  Text(
                                  'Add Details of place',
                                  style: GoogleFonts.lato(color:Colors.black),
                                ),
                                floatingLabelStyle:
                                 TextStyle(color: mainColor,),
                              )),
                          const SizedBox(height: 30,),

                          Text(
                            'Enter the number of daily working hours 24 or 12',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: mainColor,

                            ),
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            validator: (value) {
                              try {
                                int.parse(value!);
                                return null; // Return null if parsing succeeds (input is an integer)
                              } catch (e) {
                                return 'Please enter a valid integer number.';
                              }
                            },
                            controller: targetController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: mainColor,
                                      width: 2
                                  )
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(1),
                              prefixIcon: Icon(Icons.troubleshoot, color: mainColor,),
                              hintText: "Number of daily working hours",
                              hintStyle: GoogleFonts.lato(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer()   ,
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 40),
                      child: InkWell(
                        child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                BorderRadius.circular(
                                    15)),
                            child:   Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
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
                            )
                        ),
                        onTap: () {
                          if(formKey.currentState!.validate())
                          {
                            // AdminCubit.get(context).addPercentageOfEvent(nameOfEvent, percentageController.text);
                            // AdminCubit.get(context).addDetailsOfEvent(nameOfEvent, detailsController.text);
                            // AdminCubit.get(context).addTargetOfEvent(nameOfEvent, targetController.text);
                             AdminCubit.get(context).addInformationForPlace(nameOfPlace, detailsController.text, int.parse(targetController.text));

                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ) ,
        );
      },

    );
  }
}
