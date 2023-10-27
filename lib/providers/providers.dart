import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zartek_work/models/foodmodel.dart';

// loading auth provider

final loadingProvider = StateProvider<bool>((ref) {
  return false;
});

class CartListNotifier extends ChangeNotifier {
  List<CategoryDish> _cartlist = [];
  List<CategoryDish> get cartlist => _cartlist;

  void metadata(CategoryDish categorydata) {
    // Checking if the cart is empty
    if (_cartlist.isEmpty) {
      categorydata = categorydata.copyWith(itemCount: 1);
      _cartlist.add(categorydata);
    } else {
      // Flag to indicate whether the item was found in the cart or not
      bool itemFound = false;
      for (var item in _cartlist) {
        if (item.dishId == categorydata.dishId) {
          // If the item is exists in the cart, increment the item count with 1
          item.itemCount++;
          itemFound = true;
          break; // No need to continue searching because we found the iem in the list
        }
      }
      // If the item was not found in the cartlist, add it with a count of 1
      if (!itemFound) {
        categorydata = categorydata.copyWith(itemCount: 1);
        _cartlist.add(categorydata);
      }
    }
    notifyListeners();
  }

  void removeitem(CategoryDish categorydata) {
    for (var i in _cartlist) {
      if (i.dishId == categorydata.dishId) {
        if (i.itemCount > 1) {
          i.itemCount--;
        } else {
          _cartlist.remove(i);
        }
        notifyListeners();
        break; // Stop after the first occurrence of the item is modified
      }
    }
  }

  int? itemCount(String id) {
    for (var i in _cartlist) {
      if (id == i.dishId) {
        return i.itemCount;
      }
    }
    if (_cartlist.isEmpty) {
      return 0;
    }
    return null;
  }

  double totalprice() {
    double sum = 0;
    for (var i in _cartlist) {
      sum = sum + i.dishPrice! * i.itemCount;
    }
    return sum;
  }

  void clearlist() {
    _cartlist = [];
    notifyListeners();
  }
}

final cartProvider = ChangeNotifierProvider<CartListNotifier>((ref) {
  return CartListNotifier();
});
