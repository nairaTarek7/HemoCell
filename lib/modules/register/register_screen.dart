import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/layout/hemo_cell_layout.dart';
import 'package:hemo_cell/shared/components/components.dart';

import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var PhoneController = TextEditingController();
  var NameController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
  return  BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if(state is RegisterErrorState)
          {
            showToast(text: '${state.error}', state: ToastState.ERROR);
          }
          if (state is CreateUserSuccessState) {
            showToast(text: 'Register Successfully', state: ToastState.SUCCESS);

            CacheHelper.saveData(key: 'userId', value: state.uId).then((value) {
              userId = state.uId;
            });
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>  HemoCellLayout()),
                    (route) => false);
          }
        },
        builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(onPressed: () {
                    Navigator.pop(context);
                  },
                    icon: Icon(Icons.chevron_left, color: mainColor, size: 32,),
                    padding: EdgeInsets.zero,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Registerathion ',
                    style: GoogleFonts.bangers(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                        fontSize: 32
                    ),
                  ),
                ),
                if(state is RegisterLoadingState)
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: LinearProgressIndicator(
                    color: mainColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 50, bottom: 0),
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
                      const SizedBox(height: 10,),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name must not empty";
                          }
                          return null;
                        },
                        controller: NameController,
                        keyboardType: TextInputType.name,
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
                          prefixIcon: Icon(Icons.format_color_text_outlined,
                            color: mainColor,),
                          hintText: "Name",
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter your email',
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
                            return "Email must not empty";
                          }
                          return null;
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
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
                          prefixIcon: Icon(Icons.email, color: mainColor,),
                          hintText: "Email",
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter your phone',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Phone must not empty";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
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
                          fillColor: Colors.white.withOpacity(0.5),
                          prefixIcon: Icon(Icons.phone, color: mainColor,),
                          hintText: "Phone",
                          hintStyle: GoogleFonts.lato(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        controller: PhoneController,
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
                        'Enter your password',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Password must not empty";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
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
                          fillColor: Colors.white.withOpacity(0.5),
                          prefixIcon: Icon(Icons.lock, color: mainColor,),
                          hintText: "Password",
                          hintStyle: GoogleFonts.lato(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        obscureText: true,
                        controller: passwordController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: mainColor,
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          RegisterCubit.get(context).userRegister(
                            name: NameController.text,
                            email: emailController.text,
                            phone: PhoneController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      child: Text(
                        'Register',
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
  },
    ),
    );
  }
}