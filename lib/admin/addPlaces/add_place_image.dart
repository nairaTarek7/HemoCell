import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/admin/addPlaces/add_details_and_hours_screen.dart';

import '../../shared/components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class AddImageOfPlaceScreen extends StatelessWidget {
  final nameOfPlace;

  AddImageOfPlaceScreen(this.nameOfPlace);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        if (state is UploadProfileImageSuccessState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddDetailsAndHoursOfWorkScreen(nameOfPlace,AdminCubit.get(context).profileImage)));
        }
        if(state is UploadProfileImageSuccessState )
        {
          showToast(text: 'Event image has been added successfully' , state: ToastState.SUCCESS);
        }
      },
      builder: (context, state) {
        var profileImage = AdminCubit.get(context).profileImage;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                            AdminCubit.get(context).deleteEventFromFireBase(nameOfPlace);
                          }
                          , icon: Icon(Icons.chevron_left,size: 32,color:mainColor,)
                      ),
                      Text(
                        'Add image of place',
                        style: GoogleFonts.bangers(
                            color:mainColor,
                            fontSize:24
                        ),
                      )
                    ],),
                ),

                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 100),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Add image of place',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: mainColor),
                            ),
                          ),
                          AdminCubit.get(context).profileImage == null ?
                          Material(
                            elevation: 10,
                            borderRadius:  BorderRadius.circular(15),
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              decoration:  BoxDecoration(
                                border: Border.all(width:1.5),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white.withOpacity(0.50),

                              ),
                              child: Center(
                                child: Text(
                                  'Your image display here',
                                  style: GoogleFonts.lato(
                                    fontWeight:FontWeight.bold,
                                    fontSize:24,
                                    color:mainColor,
                                  ),
                                ),
                              )
                            ),
                          )

                              :
                          Material(
                            elevation: 10,
                            borderRadius:  BorderRadius.circular(15),
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              decoration:  BoxDecoration(
                                border: Border.all(width:1.5,color:       AdminCubit.get(context).profileImage == null ? Colors.black :mainColor
                                ),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white.withOpacity(0.50),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(profileImage!) as ImageProvider
                                )
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    right: 20,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration:const BoxDecoration(
                                    shape: BoxShape.circle,
                                        color: Colors.white
                                                                  ),
                                      child: IconButton(onPressed: (){
                                        AdminCubit.get(context).deleteEventImage();
                                      },
                                          padding: EdgeInsets.zero,
                                          icon: Icon(Icons.delete,size: 24,color: mainColor,)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30,),

                          AdminCubit.get(context).profileImage == null ?

                          Center(
                            child: InkWell(
                              child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Get image',
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
                                  AdminCubit.get(context).getProfileImage();
                                }
                              },
                            ),
                          )
                              :
                              const SizedBox(),

                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: InkWell(
                              child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(10)),
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
                                  AdminCubit.get(context).uploadPlaceImage(nameOfPlace);
                                }
                              },
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}