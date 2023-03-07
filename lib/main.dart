import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_app/src/features/features.dart';
import 'package:harry_potter_app/theme/theme.dart';

import 'core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((_) => getIt<HomeBloc>())),
      ],
      child: MaterialApp(
        title: 'Harry Potter - App',
        theme: primaryTheme,
        darkTheme: darkTheme,
        routes: CustomRoutes.customRoute(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
      ),
    );
  }
}
