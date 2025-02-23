import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app_router.dart';

void main() {
  runApp(LearnBlocApp(appRouter: AppRouter()));
}

class LearnBlocApp extends StatelessWidget {
  final AppRouter appRouter;
  const LearnBlocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
