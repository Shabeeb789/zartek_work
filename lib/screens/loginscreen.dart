import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zartek_work/providers/providers.dart';
import 'package:zartek_work/screens/phonescreen.dart';

import 'package:zartek_work/services/authserviceprovider.dart';
import 'package:zartek_work/utils/responsive.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(loadingProvider)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Responsive.height(86, context),
                      horizontal: Responsive.width(32, context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Responsive.height(120, context),
                      ),
                      Image.asset("assets/images/firebase.png"),
                      SizedBox(
                        height: Responsive.height(220, context),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          ref.read(loadingProvider.notifier).state = true;
                          ref.read(authServiceProvider).signInWithGoogle();
                          ref.read(loadingProvider.notifier).state = false;
                        },
                        icon: SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            "assets/images/google.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        label: const Text(
                          "Login with google",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(width: 1),
                            minimumSize: Size(double.infinity,
                                Responsive.height(40, context)),
                            backgroundColor: Colors.blue),
                      ),
                      SizedBox(
                        height: Responsive.height(20, context),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return PhoneScreen();
                              },
                            ));
                          },
                          icon: const Icon(
                            Icons.phone_android,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Login with phone",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              side: BorderSide(width: 1),
                              backgroundColor: Colors.green),
                        ),
                      ),
                      SizedBox(
                        height: Responsive.height(20, context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
