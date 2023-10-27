import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zartek_work/screens/otpscreen.dart';

final countryCodeProvider = StateProvider<String>((ref) {
  return "91";
});

class PhoneScreen extends ConsumerWidget {
  PhoneScreen({super.key});

  final TextEditingController phonenumbercontroller = TextEditingController();
  static String verify = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IntlPhoneField(
                controller: phonenumbercontroller,
                decoration: const InputDecoration(
                  labelText: "Enter phone number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
                initialCountryCode: "IN",
                onCountryChanged: (value) {
                  ref.read(countryCodeProvider.notifier).state = value.dialCode;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber:
                        "+${ref.watch(countryCodeProvider)}${phonenumbercontroller.text}",
                    verificationCompleted: (phoneAuthCredential) {},
                    verificationFailed: (error) {},
                    codeSent: (verificationId, resendingToken) {
                      //verify phone nuberoil ninnum verification id phonescreen classile  verify enna variablekk store cheythu
                      PhoneScreen.verify = verificationId;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(),
                          ));
                    },
                    timeout: const Duration(seconds: 30),
                    codeAutoRetrievalTimeout: (verificationId) {},
                  );
                },
                child: const Text("send code"))
          ],
        ),
      ),
    );
  }
}
