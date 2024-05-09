import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/admin/addPlaces/add_place_image.dart';
import 'package:hemo_cell/admin/cubit/cubit.dart';
import 'package:hemo_cell/admin/cubit/states.dart';
import 'package:hemo_cell/shared/components/components.dart';

class AddNameOfPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        if (state is CreateEventSuccessState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddImageOfPlaceScreen(nameController.text)));
        }
        if (state is CreateEventSuccessState) {
          showToast(
              text: 'Place name has been added successfully',
              state: ToastState.SUCCESS);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
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
                        Text(
                          'Add name of place',
                          style: GoogleFonts.bangers(
                              color: mainColor, fontSize: 24),
                        )
                      ],
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 100, bottom: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enter name of place',
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
                                    return "Name of place must not empty";
                                  }
                                  return null;
                                },
                                controller: nameController,
                                keyboardType: TextInputType.emailAddress,
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
                                    Icons.event,
                                    color: mainColor,
                                  ),
                                  hintText: "Name of place",
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
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                                    state is CreateEventLoadingState
                                        ? const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 4,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        : Text(
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
                                AdminCubit.get(context)
                                    .addPlace(nameOfPlace: nameController.text);
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
