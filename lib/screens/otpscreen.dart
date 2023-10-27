import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:zartek_work/screens/homescreen.dart';
import 'package:zartek_work/screens/phonescreen.dart';
import 'package:zartek_work/utils/responsive.dart';

class OtpScreen extends ConsumerWidget {
  OtpScreen({super.key});
  final TextEditingController pinController = TextEditingController();

  var code = "";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter 6 digits verification sent to your number ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.width(16, context)),
            ),
            SizedBox(
              height: Responsive.height(20, context),
            ),
            Pinput(
              length: 6,
              showCursor: true,
              onChanged: (value) {
                code = value;
              },
              defaultPinTheme: PinTheme(
                  height: 45,
                  width: 45,
                  textStyle:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: Responsive.height(20, context),
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: PhoneScreen.verify, smsCode: code);

                    await FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (route) => false);
                    });
                  } on FirebaseAuthException catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                child: Text("confirm"))
          ],
        ),
      ),
    );
  }
}
