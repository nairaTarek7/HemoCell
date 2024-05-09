import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemo_cell/admin/detailsOfDonations/cubit/states.dart';
import 'package:hemo_cell/models/eventsModel.dart';
import 'package:hemo_cell/modules/donate/cubit/states.dart';
import 'package:hemo_cell/shared/components/constants.dart';

import '../../../models/donateByEventModel.dart';

class DetailsCubit extends Cubit<DetailsDonationsStates> {
  DetailsCubit() : super(DetailsDonationsInitialState());
  static DetailsCubit get(context) => BlocProvider.of(context);
  /////////////////
  int indexOfChangePages = 0;
  void ChangeOfIndexOfPages1() {
    indexOfChangePages = 1;
    emit(ChangeIndexSuccessfullyState());
  }

  void ChangeOfIndexOfPages2() {
    indexOfChangePages = 2;
    emit(ChangeIndexSuccessfullyState());
  }

  void ChangeOfIndexOfPages3() {
    indexOfChangePages = 3;
    emit(ChangeIndexSuccessfullyState());
  }

  /////////////////
  void updateIsDoneToTrue(String eventId, int index, useId, name, time) {
    // Reference to the Firestore collection
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');

    // Get the document reference for the event
    DocumentReference eventRef = events.doc(eventId);

    // Update the isDone field to true for the donation at the specified index
    eventRef.get().then((eventDoc) {
      // Cast the data to a Map<String, dynamic>
      Map<String, dynamic> eventData = eventDoc.data() as Map<String, dynamic>;

      // Retrieve listOfDonations from the eventData
      List<dynamic> listOfDonations = eventData['listOfDonations'];

      // Update the isDone field of the donation at the specified index
      listOfDonations[index]['isDone'] = true;

      // Update the event document with the modified listOfDonations
      eventRef
          .update({'listOfDonations': listOfDonations})
          .then((value) => print("Document updated successfully"))
          .catchError((error) => print("Failed to update document: $error"));
    }).then((value) {
      updateIsDoneToTrueForUser(eventId, index, useId, name, time);
    });
  }

  void updateIsDoneToTrueForUser(String eventId, int index, useId, name, time) {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    // Get the document reference for the user
    DocumentReference userRef = usersCollection.doc(userId);

    // Get the user document and update isDone field for matching donation
    userRef.get().then((userDoc) {
      // Check if the user document exists and contains the expected data
      if (userDoc.exists) {
        // Cast the data to Map<String, dynamic>
        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;

        // Check if userData is not null and contains the expected field
        if (userData != null && userData.containsKey('listOfBloodByEvent')) {
          // Get the list of donations from the userData
          List<dynamic> listOfDonations = userData['listOfBloodByEvent'];

          // Iterate through the list of donations
          for (int i = 0; i < listOfDonations.length; i++) {
            // Get the current donation map
            Map<String, dynamic> donation = listOfDonations[i];

            // Check if the name and time match
            if (donation['nameOfEvent'] == name &&
                donation['timestampOfBegin'] == time) {
              // Update the isDone field to false

              listOfDonations[i]['isDone'] = true;
              break; // Exit loop since we found the matching donation
            }
          }

          // Update the user document with the modified listOfDonations
          userRef
              .update({'listOfBloodByEvent': listOfDonations})
              .then((_) => print("Document updated successfully"))
              .catchError(
                  (error) => print("Failed to update document: $error"));
        } else {
          print("User data is missing the expected field.");
        }
      } else {
        print("User document not found.");
      }
    }).catchError((error) => print("Error getting user document: $error"));
  }

////////////////////////////////////////////

  void updateIsDoneToTrueForNeedBloodBags(
      String nameOfDoc, int index, useId, time, amountOfBags, typeOfBlood) {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('ourPlaces');

    // Get the document reference for the user
    DocumentReference userRef = usersCollection.doc(nameOfDoc);

    // Get the user document and update isDone field for matching donation
    userRef.get().then((eventId) {
      // Check if the user document exists and contains the expected data
      if (eventId.exists) {
        // Cast the data to Map<String, dynamic>
        Map<String, dynamic>? userData =
            eventId.data() as Map<String, dynamic>?;

        // Check if userData is not null and contains the expected field
        if (userData != null && userData.containsKey('listOfNeedBlood')) {
          // Get the list of donations from the userData
          List<dynamic> listOfDonations = userData['listOfNeedBlood'];

          // Iterate through the list of donations
          for (int i = 0; i < listOfDonations.length; i++) {
            // Get the current donation map
            Map<String, dynamic> donation = listOfDonations[i];

            // Check if the name and time match
            if (donation['userId'] == userId &&
                donation['timestampOfBegin'] == time &&
                donation['amountOfBags'] == amountOfBags &&
                donation['typeOfBlood'] == typeOfBlood) {
              // Update the isDone field to false

              listOfDonations[i]['isDone'] = true;
              break; // Exit loop since we found the matching donation
            }
          }
          updateIsDoneToTrueForUserForRegularDonations(useId, time);

          // Update the user document with the modified listOfDonations
          userRef
              .update({'listOfNeedBlood': listOfDonations})
              .then((value) {})
              .catchError(
                  (error) => print("Failed to update document: $error"));
        } else {
          print("User data is missing the expected field.");
        }
      } else {
        print("User document not found.");
      }
    }).catchError((error) => print("Error getting user document: $error"));
  }

  void updateIsDoneToTrueForUserForNeedBloodBags(
      useId, time, amountOfBags, typeOfBlood) {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    // Get the document reference for the user
    DocumentReference userRef = usersCollection.doc(userId);

    // Get the user document and update isDone field for matching donation
    userRef.get().then((userDoc) {
      // Check if the user document exists and contains the expected data
      if (userDoc.exists) {
        // Cast the data to Map<String, dynamic>
        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;

        // Check if userData is not null and contains the expected field
        if (userData != null && userData.containsKey('listOfBloodBags')) {
          // Get the list of donations from the userData
          List<dynamic> listOfDonations = userData['listOfBloodBags'];

          // Iterate through the list of donations
          for (int i = 0; i < listOfDonations.length; i++) {
            // Get the current donation map
            Map<String, dynamic> donation = listOfDonations[i];

            // Check if the name and time match
            if (donation['userId'] == userId &&
                donation['timestampOfBegin'] == time &&
                donation['amountOfBags'] == amountOfBags &&
                donation['typeOfBlood'] == typeOfBlood) {
              // Update the isDone field to false

              listOfDonations[i]['isDone'] = true;
              break; // Exit loop since we found the matching donation
            }
          }

          // Update the user document with the modified listOfDonations
          userRef
              .update({'listOfBloodBags': listOfDonations})
              .then((_) => print("Document updated successfully"))
              .catchError(
                  (error) => print("Failed to update document: $error"));
        } else {
          print("User data is missing the expected field.");
        }
      } else {
        print("User document not found.");
      }
    }).catchError((error) => print("Error getting user document: $error"));
  }

  void updateIsDoneToFalseForNeedBloodBags(
      String nameOfDoc, int index, useId, time, amountOfBags, typeOfBlood) {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('ourPlaces');

    // Get the document reference for the user
    DocumentReference userRef = usersCollection.doc(nameOfDoc);

    // Get the user document and update isDone field for matching donation
    userRef.get().then((eventId) {
      // Check if the user document exists and contains the expected data
      if (eventId.exists) {
        // Cast the data to Map<String, dynamic>
        Map<String, dynamic>? userData =
            eventId.data() as Map<String, dynamic>?;

        // Check if userData is not null and contains the expected field
        if (userData != null && userData.containsKey('listOfNeedBlood')) {
          // Get the list of donations from the userData
          List<dynamic> listOfDonations = userData['listOfNeedBlood'];

          // Iterate through the list of donations
          for (int i = 0; i < listOfDonations.length; i++) {
            // Get the current donation map
            Map<String, dynamic> donation = listOfDonations[i];

            // Check if the name and time match
            if (donation['userId'] == userId &&
                donation['timestampOfBegin'] == time &&
                donation['amountOfBags'] == amountOfBags &&
                donation['typeOfBlood'] == typeOfBlood) {
              // Update the isDone field to false

              listOfDonations[i]['isDone'] = false;
              break; // Exit loop since we found the matching donation
            }
          }
          updateIsDoneToFalseForUserForNeedBloodBags(
              useId, time, amountOfBags, typeOfBlood);

          // Update the user document with the modified listOfDonations
          userRef
              .update({'listOfNeedBlood': listOfDonations})
              .then((value) {})
              .catchError(
                  (error) => print("Failed to update document: $error"));
        } else {
          print("User data is missing the expected field.");
        }
      } else {
        print("User document not found.");
      }
    }).catchError((error) => print("Error getting user document: $error"));
  }

  void updateIsDoneToFalseForUserForNeedBloodBags(
      useId, time, amountOfBags, typeOfBlood) {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    // Get the document reference for the user
    DocumentReference userRef = usersCollection.doc(userId);

    // Get the user document and update isDone field for matching donation
    userRef.get().then((userDoc) {
      // Check if the user document exists and contains the expected data
      if (userDoc.exists) {
        // Cast the data to Map<String, dynamic>
        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;

        // Check if userData is not null and contains the expected field
        if (userData != null && userData.containsKey('listOfBloodBags')) {
          // Get the list of donations from the userData
          List<dynamic> listOfDonations = userData['listOfBloodBags'];

          // Iterate through the list of donations
          for (int i = 0; i < listOfDonations.length; i++) {
            // Get the current donation map
            Map<String, dynamic> donation = listOfDonations[i];

            // Check if the name and time match
            if (donation['userId'] == userId &&
                donation['timestampOfBegin'] == time &&
                donation['amountOfBags'] == amountOfBags &&
                donation['typeOfBlood'] == typeOfBlood) {
              // Update the isDone field to false

              listOfDonations[i]['isDone'] = false;
              break; // Exit loop since we found the matching donation
            }
          }

          // Update the user document with the modified listOfDonations
          userRef
              .update({'listOfBloodBags': listOfDonations})
              .then((_) => print("Document updated successfully"))
              .catchError(
                  (error) => print("Failed to update document: $error"));
        } else {
          print("User data is missing the expected field.");
        }
      } else {
        print("User document not found.");
      }
    }).catchError((error) => print("Error getting user document: $error"));
  }

////////////////////////////////////////////////
  void updateIsDoneToTrueForRegularDonation(String eventId, useId, time) {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('regularDonations');

    // Get the document reference for the user
    DocumentReference userRef = usersCollection.doc(eventId);

    // Get the user document and update isDone field for matching donation
    userRef.get().then((eventId) {
      // Check if the user document exists and contains the expected data
      if (eventId.exists) {
        // Cast the data to Map<String, dynamic>
        Map<String, dynamic>? userData =
            eventId.data() as Map<String, dynamic>?;

        // Check if userData is not null and contains the expected field
        if (userData != null && userData.containsKey('donations')) {
          // Get the list of donations from the userData
          List<dynamic> listOfDonations = userData['donations'];

          // Iterate through the list of donations
          for (int i = 0; i < listOfDonations.length; i++) {
            // Get the current donation map
            Map<String, dynamic> donation = listOfDonations[i];

            // Check if the name and time match
            if (donation['userId'] == useId &&
                donation['timestampOfBegin'] == time) {
              // Update the isDone field to false

              listOfDonations[i]['isDone'] = true;
              break; // Exit loop since we found the matching donation
            }
          }
          updateIsDoneToTrueForUserForRegularDonations(useId, time);

          // Update the user document with the modified listOfDonations
          userRef
              .update({'donations': listOfDonations})
              .then((value) {})
              .catchError(
                  (error) => print("Failed to update document: $error"));
        } else {
          print("User data is missing the expected field.");
        }
      } else {
        print("User document not found.");
      }
    }).catchError((error) => print("Error getting user document: $error"));
  }

  void updateIsDoneToTrueForUserForRegularDonations(useId, time) {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    // Get the document reference for the user
    DocumentReference userRef = usersCollection.doc(userId);

    // Get the user document and update isDone field for matching donation
    userRef.get().then((userDoc) {
      // Check if the user document exists and contains the expected data
      if (userDoc.exists) {
        // Cast the data to Map<String, dynamic>
        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;

        // Check if userData is not null and contains the expected field
        if (userData != null && userData.containsKey('listOfDonations')) {
          // Get the list of donations from the userData
          List<dynamic> listOfDonations = userData['listOfDonations'];

          // Iterate through the list of donations
          for (int i = 0; i < listOfDonations.length; i++) {
            // Get the current donation map
            Map<String, dynamic> donation = listOfDonations[i];

            // Check if the name and time match
            if (donation['userId'] == useId &&
                donation['timestampOfBegin'] == time) {
              // Update the isDone field to false

              listOfDonations[i]['isDone'] = true;
              break; // Exit loop since we found the matching donation
            }
          }
          // Update the user document with the modified listOfDonations
          userRef
              .update({'listOfDonations': listOfDonations})
              .then((_) => print("Document updated successfully"))
              .catchError(
                  (error) => print("Failed to update document: $error"));
        } else {
          print("User data is missing the expected field.");
        }
      } else {
        print("User document not found.");
      }
    }).catchError((error) => print("Error getting user document: $error"));
  }

////////////////////////////////////////////
  void updateIsDoneToFalse(String eventId, int index, useId, name, time) {
    // Reference to the Firestore collection
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');

    // Get the document reference for the event
    DocumentReference eventRef = events.doc(eventId);

    // Update the isDone field to true for the donation at the specified index
    eventRef.get().then((eventDoc) {
      // Cast the data to a Map<String, dynamic>
      Map<String, dynamic> eventData = eventDoc.data() as Map<String, dynamic>;

      // Retrieve listOfDonations from the eventData
      List<dynamic> listOfDonations = eventData['listOfDonations'];

      // Update the isDone field of the donation at the specified index
      listOfDonations[index]['isDone'] = false;

      // Update the event document with the modified listOfDonations
      eventRef
          .update({'listOfDonations': listOfDonations})
          .then((value) => print("Document updated successfully"))
          .catchError((error) => print("Failed to update document: $error"));
    }).then((value) {
      updateIsDoneToFalseForUser(useId, name, time);
      updateTarget(eventId);
    });
  }

  void updateIsDoneToFalseForUser(String userId, name, time) {
    // Reference to the Firestore collection
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    // Get the document reference for the user
    DocumentReference userRef = usersCollection.doc(userId);

    // Get the user document and update isDone field for matching donation
    userRef.get().then((userDoc) {
      // Check if the user document exists and contains the expected data
      if (userDoc.exists) {
        // Cast the data to Map<String, dynamic>
        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;

        // Check if userData is not null and contains the expected field
        if (userData != null && userData.containsKey('listOfBloodByEvent')) {
          // Get the list of donations from the userData
          List<dynamic> listOfDonations = userData['listOfBloodByEvent'];

          // Iterate through the list of donations
          for (int i = 0; i < listOfDonations.length; i++) {
            // Get the current donation map
            Map<String, dynamic> donation = listOfDonations[i];

            // Check if the name and time match
            if (donation['nameOfEvent'] == name &&
                donation['timestampOfBegin'] == time) {
              // Update the isDone field to false
              listOfDonations[i]['isDone'] = false;
              break; // Exit loop since we found the matching donation
            }
          }

          // Update the user document with the modified listOfDonations
          userRef
              .update({'listOfBloodByEvent': listOfDonations})
              .then((_) => print("Document updated successfully"))
              .catchError(
                  (error) => print("Failed to update document: $error"));
        } else {
          print("User data is missing the expected field.");
        }
      } else {
        print("User document not found.");
      }
    }).catchError((error) => print("Error getting user document: $error"));
  }

  void updateTarget(String eventId) async {
    final doc = FirebaseFirestore.instance.collection('events').doc(eventId);
    final docSnapshot = await doc.get();
    var data = docSnapshot.data();

    int currentRateOneStar = data?['target'] ?? 0;
    int newRateOneStar = currentRateOneStar - 1;
    FirebaseFirestore.instance
        .collection('events')
        .doc(eventId)
        .update({'target': newRateOneStar});
  }

//////////////////////////////////////////////////

  void updateIsDoneToFalseForRegularDonation(String eventId, useId, time) {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('regularDonations');

    // Get the document reference for the user
    DocumentReference userRef = usersCollection.doc(eventId);

    // Get the user document and update isDone field for matching donation
    userRef.get().then((eventId) {
      // Check if the user document exists and contains the expected data
      if (eventId.exists) {
        // Cast the data to Map<String, dynamic>
        Map<String, dynamic>? userData =
            eventId.data() as Map<String, dynamic>?;

        // Check if userData is not null and contains the expected field
        if (userData != null && userData.containsKey('donations')) {
          // Get the list of donations from the userData
          List<dynamic> listOfDonations = userData['donations'];

          // Iterate through the list of donations
          for (int i = 0; i < listOfDonations.length; i++) {
            // Get the current donation map
            Map<String, dynamic> donation = listOfDonations[i];

            // Check if the name and time match
            if (donation['userId'] == useId &&
                donation['timestampOfBegin'] == time) {
              // Update the isDone field to false

              listOfDonations[i]['isDone'] = false;
              break; // Exit loop since we found the matching donation
            }
          }

          // Update the user document with the modified listOfDonations
          userRef
              .update({'donations': listOfDonations})
              .then((value) {})
              .catchError((error) => print("Failed to update document: $error"))
              .then((value) {
                updateIsDoneToFalseForUserForRegularDonations(useId, time);
              });
        } else {
          print("User data is missing the expected field.");
        }
      } else {
        print("User document not found.");
      }
    }).catchError((error) => print("Error getting user document: $error"));
  }

  void updateIsDoneToFalseForUserForRegularDonations(useId, time) {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    // Get the document reference for the user
    DocumentReference userRef = usersCollection.doc(userId);

    // Get the user document and update isDone field for matching donation
    userRef.get().then((userDoc) {
      // Check if the user document exists and contains the expected data
      if (userDoc.exists) {
        // Cast the data to Map<String, dynamic>
        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;

        // Check if userData is not null and contains the expected field
        if (userData != null && userData.containsKey('listOfDonations')) {
          // Get the list of donations from the userData
          List<dynamic> listOfDonations = userData['listOfDonations'];

          // Iterate through the list of donations
          for (int i = 0; i < listOfDonations.length; i++) {
            // Get the current donation map
            Map<String, dynamic> donation = listOfDonations[i];

            // Check if the name and time match
            if (donation['userId'] == useId &&
                donation['timestampOfBegin'] == time) {
              // Update the isDone field to false

              listOfDonations[i]['isDone'] = false;
              break; // Exit loop since we found the matching donation
            }
          }
          // Update the user document with the modified listOfDonations
          userRef
              .update({'listOfDonations': listOfDonations})
              .then((_) => print("Document updated successfully"))
              .catchError(
                  (error) => print("Failed to update document: $error"));
        } else {
          print("User data is missing the expected field.");
        }
      } else {
        print("User document not found.");
      }
    }).catchError((error) => print("Error getting user document: $error"));
  }
}
