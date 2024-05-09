import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemo_cell/models/placeModel.dart';
import 'package:hemo_cell/models/placeModel2.dart';
import 'package:hemo_cell/modules/needBlood/cubit/states.dart';
import 'package:hemo_cell/modules/register/cubit/states.dart';

import '../../../models/userModel.dart';
import '../../../shared/components/constants.dart';

class NeedBloodCubit extends Cubit<NeedBloodStates> {
  NeedBloodCubit() : super(NeedBloodInitialState());

  static NeedBloodCubit get(context) => BlocProvider.of(context);

  needBlood(nameOfPlace, typeOfBlood, dynamic amountOfBags) async {
    var model = PlaceModel2(
      typeOfBlood: typeOfBlood,
      timestampOfBegin: Timestamp.now(),
      userId: userId,
      amountOfBags: amountOfBags,
      isDone: null,
      nameOfPlace: nameOfPlace,
    );

    final docSnapshot = await FirebaseFirestore.instance
        .collection('ourPlaces')
        .doc(nameOfPlace)
        .get();
    if (docSnapshot.exists) {
      final doc =
          FirebaseFirestore.instance.collection('ourPlaces').doc(nameOfPlace);
      final docSnapshot = await doc.get();
      var data = docSnapshot.data();

      final doc2 = FirebaseFirestore.instance.collection('users').doc(userId);
      final docSnapshot2 = await doc2.get();
      var data2 = docSnapshot2.data();
      await FirebaseFirestore.instance
          .collection('ourPlaces')
          .doc(nameOfPlace)
          .update({
        'listOfNeedBlood': FieldValue.arrayUnion([model.toMap()]),
      }).then((value) async {
        final docSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();
        if (docSnapshot.exists) {
          // Document exists, update it
          FirebaseFirestore.instance.collection('users').doc(userId).update({
            'listOfBloodBags': FieldValue.arrayUnion([model.toMap()]),
          }).then((value) {
            emit(DonateByEventSuccessfullyState());
            int numberOfSample = data?['$typeOfBlood'] ?? 0;
            int updatedNumber =
                numberOfSample - int.parse(amountOfBags.toString());
            FirebaseFirestore.instance
                .collection('ourPlaces')
                .doc(nameOfPlace)
                .update({'$typeOfBlood': updatedNumber});

            int numberOfDonation = data2?['numberOfBloodRecipient'] ?? 0;
            int updatedNumberDonation = numberOfDonation + 1;
            FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .update({'numberOfBloodRecipient': updatedNumberDonation});
          }).catchError((error) {
            emit(DonateByEventErrorState(error.toString()));
            print(error);
          });
        }
        emit(DonateByEventSuccessfullyState());
      }).catchError((error) {
        emit(DonateByEventErrorState(error.toString()));
      });
    } else {
      // Document does not exist, create it
      await FirebaseFirestore.instance
          .collection('ourPlaces')
          .doc(nameOfPlace)
          .update({'listOfNeedBlood': model}).then((value) async {
        final docSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (docSnapshot.exists) {
          // Document exists, update it
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .update({
            'listOfBloodBags': FieldValue.arrayUnion([model.toMap()]),
          }).then((value) {
            // emit(DonateByEventSuccessfullyState());
          }).catchError((error) {
            emit(DonateByEventErrorState(error.toString()));
            print(error);
          });
        }
        // emit(DonateByEventSuccessfullyState());
      }).catchError((error) {
        // emit(DonateByEventSuccessfullyState());
      });
    }
  }
}
