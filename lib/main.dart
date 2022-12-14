import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/data/firebase_services/firebase_auth.dart';
import 'package:naseha/data/firebase_services/firestore_naseha.dart';
import 'package:naseha/logic/auth_cubit/auth_cubit.dart';
import 'package:naseha/logic/naseha_cubit/naseha_cubit.dart';
import 'package:naseha/views/auth/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:naseha/views/home_page/home_page.dart';
import 'package:naseha/views/verify/verify_screen.dart';

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
        BlocProvider<NasehaCubit>(create: (_) => NasehaCubit(FirestoreNaseha()))
      ],
      child: MaterialApp(
        title: 'Naseha',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  FirebaseAuth.instance.currentUser!.emailVerified) {
                return HomePage();
              } else if (snapshot.hasData &&
                  !(FirebaseAuth.instance.currentUser!.emailVerified)) {
                return const VerifyScreen();
              } else {
                return const AuthPage();
              }
            }),
      ),
    );
  }
}
