import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemo_cell/admin/cubit/cubit.dart';
import 'package:hemo_cell/admin/detailsOfDonations/cubit/cubit.dart';
import 'package:hemo_cell/layout/hemo_cell_layout.dart';
import 'package:hemo_cell/modules/login/login_screen.dart';
import 'package:hemo_cell/modules/needBlood/cubit/cubit.dart';
import 'package:hemo_cell/modules/splashScreen/splash_screen.dart';
import 'package:hemo_cell/shared/components/constants.dart';
import 'package:hemo_cell/shared/network/local/cache_helper.dart';

import 'firebase_options.dart';
import 'layout/cubit/cubit.dart';
import 'modules/donate/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();

  userId = CacheHelper.getData(key: 'userId');
  Widget widget;

  if (userId != null) {
    widget = SplashPage();
  } else {
    widget = SplashPage();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({super.key, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => MainCubit()),
        BlocProvider(create: (BuildContext context) => AdminCubit()),
        BlocProvider(create: (BuildContext context) => DonateCubit()),
        BlocProvider(create: (BuildContext context) => NeedBloodCubit()),
        BlocProvider(create: (BuildContext context) => DetailsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: startWidget,
        // startWidget,
      ),
    );
  }
}
