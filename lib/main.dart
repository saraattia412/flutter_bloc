import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/router.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(  BreakingBadApp(appRouter: AppRouter(),));
}

class BreakingBadApp extends StatelessWidget {
   final AppRouter appRouter;

  const BreakingBadApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
      }
 );
  }
}

