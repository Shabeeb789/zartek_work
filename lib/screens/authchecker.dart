import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zartek_work/providers/foodproviders.dart';

import 'package:zartek_work/screens/homescreen.dart';
import 'package:zartek_work/screens/loginscreen.dart';
import 'package:zartek_work/services/authserviceprovider.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateProvider).when(
          data: (data) {
            Future.delayed(Duration.zero)
                .then((value) => ref.watch(userProvider.notifier).state = data);
            log("from auth checker $data");
            if (data == null) {
              return LoginScreen();
            } else {
              return HomeScreen();
            }
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
  }
}
