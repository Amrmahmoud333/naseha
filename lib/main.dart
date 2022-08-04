import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/data/firebase_services/firebase_auth.dart';
import 'package:naseha/data/repositories/firebase_auth_repo.dart';
import 'package:naseha/logic/auth_cubit/auth_cubit.dart';
import 'package:naseha/views/auth/login/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (_) => AuthCubit(FirebaseServicesAuth())),
      ],
      child: MaterialApp(
        title: 'Naseha',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // TODO add home page
                return LoginScreen();
              } else {
                return LoginScreen();
              }
            }),
      ),
    );
  }
}
