import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zartek_work/models/foodmodel.dart';
import 'package:zartek_work/services/apiservices.dart';

final foodProvider = FutureProvider<List<FoodApiModel>?>((ref) async {
  return ApiService().getdata();
});

final itemcountProvider = StateProvider<int>((ref) {
  return 0;
});

//userprovider//

final userProvider = StateProvider<User?>((ref) {
  return null;
});

final dishcountProvider = StateProvider<int>((ref) {
  return 0;
});
