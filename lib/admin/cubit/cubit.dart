import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemo_cell/admin/cubit/states.dart';
import 'package:hemo_cell/models/placeModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../models/eventsModel.dart';

class AdminCubit extends Cubit<AdminStates> {
  AdminCubit() : super(AdminInitialState());
  static AdminCubit get(context) => BlocProvider.of(context);
  EventModel? eventModel;
  PlaceModel? placeModel;
  File? profileImage;
  final picker = ImagePicker();
  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(EventImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(EventImagePickedErrorState());
    }
  }

  deleteEventImage() {
    profileImage = null;
    emit(DeleteEventImageSuccessState());
  }

  //////////////////////////////////////////////////////////////////
  void uploadProfileImage(
    String? nameOfEvent,
  ) {
    emit(UploadImageOfEventLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('events/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((dynamic value) {
        emit(UploadImageOfEventLoadingState());
        updateEventImage(
          nameOfEvent: nameOfEvent,
          imageOfEvent: value,
        );
      }).then((value) {
        emit(UploadProfileImageSuccessState());
      });
    }).catchError((error) {
      emit(UploadProfileImageSuccessState());
    });
  }

  void uploadPlaceImage(
    String? nameOfPlace,
  ) {
    emit(UploadImageOfEventLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('ourPlaces/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((dynamic value) {
        emit(UploadImageOfEventLoadingState());
        updatePlaceImage(
          nameOfplace: nameOfPlace,
          imageOfPlace: value,
        );
      }).then((value) {
        emit(UploadProfileImageSuccessState());
      });
    }).catchError((error) {
      emit(UploadProfileImageSuccessState());
    });
  }

  //////////////////////////////////////
  void eventCreate({
    required String nameOfEvent,
    String? image,
  }) {
    EventModel model = EventModel(
      nameOfEvent: nameOfEvent,
      imageOfEvent:
          'https://img.freepik.com/free-vector/error-404-concept-landing-page_52683-21190.jpg',
    );
    emit(CreateEventLoadingState(nameOfEvent));
    FirebaseFirestore.instance
        .collection('events')
        .doc(nameOfEvent)
        .set(model.toMap())
        .then((value) {
      emit(CreateEventSuccessState(nameOfEvent));
    }).catchError((error) {
      emit(CreateEventErrorState(error));
    });
  }

  void addPlace({
    required String nameOfPlace,
    String? image,
  }) {
    PlaceModel model = PlaceModel(
      nameOfPlace: nameOfPlace,
      imageOfPlace:
          'https://img.freepik.com/free-vector/error-404-concept-landing-page_52683-21190.jpg',
    );
    emit(CreateEventLoadingState(nameOfPlace));
    FirebaseFirestore.instance
        .collection('ourPlaces')
        .doc(nameOfPlace)
        .set(model.toMap())
        .then((value) {
      emit(CreateEventSuccessState(nameOfPlace));
    }).catchError((error) {
      emit(CreateEventErrorState(error));
    });
  }

  ////////////
  /////////////////////////
  void updateEventImage({
    String? nameOfEvent,
    String? imageOfEvent,
  }) {
    emit(UploadImageOfEventLoadingState());
    EventModel model = EventModel(
      nameOfEvent: nameOfEvent,
      imageOfEvent: imageOfEvent ?? eventModel!.imageOfEvent,
      target: 0,
      listOfDonations: [],
      usersId: [],
    );

    FirebaseFirestore.instance
        .collection('events')
        .doc(nameOfEvent)
        .update(model.toMap())
        .then((dynamic value) {
      eventModel!.imageOfEvent = value;
      emit(UploadImageOfEventSuccessState());
    }).catchError((error) {
      emit(UploadImageOfEventSuccessState());
    });
  }

  void updatePlaceImage({
    String? nameOfplace,
    String? imageOfPlace,
  }) {
    emit(UploadImageOfEventLoadingState());
    PlaceModel model = PlaceModel(
      nameOfPlace: nameOfplace,
      imageOfPlace: imageOfPlace ?? '',
      a1: 0,
      a2: 0,
      ab1: 0,
      ab2: 0,
      b1: 0,
      b2: 0,
      o1: 0,
      o2: 0,
      listOfNeedBlood: [],
    );

    FirebaseFirestore.instance
        .collection('ourPlaces')
        .doc(nameOfplace)
        .update(model.toMap())
        .then((dynamic value) {
      placeModel!.imageOfPlace = value;
      emit(UploadImageOfEventSuccessState());
    }).catchError((error) {
      emit(UploadImageOfEventSuccessState());
    });
  }

///////////////////////////
  void deleteEventFromFireBase(nameOfEvent) {
    FirebaseFirestore.instance
        .collection('events')
        .doc(nameOfEvent)
        .delete()
        .then((value) {
      emit(DeleteEventSuccessState());
    }).catchError((error) {
      emit(DeleteEventErrorState());
    });
  }

////////////////////////////////////
  final CollectionReference detailRef =
      FirebaseFirestore.instance.collection('events');
  void addDetailsOfEvent(
    String nameOfEvent,
    String detail,
  ) async {
    emit(AddDetailsOfEventLoadingState());
    await detailRef.doc(nameOfEvent).update({'details': detail}).then((value) {
      emit(AddDetailsOfEventSuccessState());
    }).catchError((error) {
      emit(AddDetailsOfEventErrorState());
    });
  }

  final CollectionReference detailPlaceRef =
      FirebaseFirestore.instance.collection('ourPlaces');
  void addDetailsOfPlace(
    String nameOfEvent,
    String detail,
  ) async {
    emit(AddDetailsOfEventLoadingState());
    await detailPlaceRef
        .doc(nameOfEvent)
        .update({'details': detail}).then((value) {
      emit(AddDetailsOfEventSuccessState());
    }).catchError((error) {
      emit(AddDetailsOfEventErrorState());
    });
  }

  ///////////////////////////////////////
  final CollectionReference targetRef =
      FirebaseFirestore.instance.collection('events');
  void addTargetOfEvent(
    String nameOfEvent,
    dynamic target,
  ) async {
    emit(AddTargetOfEventLoadingState());
    await targetRef
        .doc(nameOfEvent)
        .update({'fixedTarget': target}).then((value) {
      emit(AddTargetOfEventSuccessState());
    }).catchError((error) {
      emit(AddTargetOfEventErrorState());
    });
  }

  final CollectionReference hoursOfWorkRef =
      FirebaseFirestore.instance.collection('ourPlaces');
  void addHoursOfWork(
    String nameOfPlace,
    dynamic hoursOfWork,
  ) async {
    emit(AddTargetOfEventLoadingState());
    await hoursOfWorkRef
        .doc(nameOfPlace)
        .update({'hoursOfWork': hoursOfWork}).then((value) {
      emit(AddTargetOfEventSuccessState());
    }).catchError((error) {
      emit(AddTargetOfEventErrorState());
    });
  }

//////////////////////////////////////////
  addInformation(nameOfEvent, detail, fixedTarget) {
    addTargetOfEvent(nameOfEvent, fixedTarget);
    addDetailsOfEvent(nameOfEvent, detail);
    emit(DoneAddInfoSuccessState());
  }

  addInformationForPlace(nameOfPlace, detail, hoursOfWork) {
    addHoursOfWork(nameOfPlace, hoursOfWork);
    addDetailsOfPlace(nameOfPlace, detail);
    emit(DoneAddInfoSuccessState());
  }
///////////////////

  updateBloodBags(nameOfPlace, a1, a2, b1, b2, ab1, ab2, o1, o2) async {
    await hoursOfWorkRef.doc(nameOfPlace).update({
      'A+': a1,
      'A-': a2,
      'B+': b1,
      'B-': b2,
      'AB+': ab1,
      'AB-': ab2,
      'O+': o1,
      'O-': o2
    });
    emit(DoneAddInfoSuccessState());
  }
}
