import 'package:arena_management/features/presentation/pages/splash_screen.dart';
import 'package:arena_management/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/presentation/bloc/device_bloc.dart';
import 'features/presentation/bloc/device_event.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
void main()async {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
    ],
  );
  await Hive.initFlutter();
  // Hive.registerAdapter(GameModelAdapter());
  await Hive.openBox('game_box');
  print('Hive box opened: ${Hive.box('game_box')}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
     providers: [
       BlocProvider(create: (BuildContext context)=> DeviceBloc()..add(LoadDevices()),),
     ],
     child: MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(appBar: AppBar(backgroundColor: Colors.yellow,),),
       initialRoute: SplashScreen.routeName,
       onGenerateRoute: AppRouter.onGenerateRoute,
     ),
   );
  }

}
