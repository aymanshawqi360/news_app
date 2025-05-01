import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/extensions.dart';
import 'package:news_app/core/notworking/firebase_factory.dart';
import 'package:news_app/core/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                FirebaseFactory().firebaseAuth!.signOut();

                // GoogleSignIn googleSignIn = GoogleSignIn();
                FirebaseFactory().googleSignIn!.disconnect();
                // FirebaseFactory().facebookAuth!.logOut();

                // googleSignIn.disconnect();

                context.pushNamedAndRemoveUntil(Routes.login,
                    predicate: (v) => false);
              },
              child: const Icon(Icons.output))
        ],
      ),
      body: Center(child: Center(child: Text("HomeScreen"))),
    );
  }
}
