
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemo_cell/layout/hemo_cell_layout.dart';
import 'package:hemo_cell/shared/components/components.dart';

class FinishScreenToAddPlace extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 260,),
            Center(child: Text('The place has been added successfully',textAlign: TextAlign.center,style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 24,color:mainColor),)),
            const SizedBox(height: 200,),
            Center(
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
                          'Back to home',
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
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HemoCellLayout()), (route) => false);


                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

