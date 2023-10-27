import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zartek_work/utils/responsive.dart';

import '../providers/foodproviders.dart';
import '../providers/providers.dart';

class Cartpage extends ConsumerWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var list = ref.watch(cartProvider).cartlist;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: list.isEmpty
          ? const Center(
              child: Text("Empty cart"),
            )
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(Responsive.width(20, context)),
                padding: EdgeInsets.all(Responsive.width(10, context)),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: Offset(1, 5))
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Responsive.width(10, context)),
                      alignment: Alignment.center,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green[900],
                      ),
                      child: Text(
                        "${list.length} Dishes - ${ref.watch(dishcountProvider)}items",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          vertical: Responsive.width(20, context)),
                      itemCount: list.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.crop_square_sharp,
                                  color: list[index].dishType == 2
                                      ? Colors.green
                                      : Colors.red,
                                  size: 24,
                                ),
                                Icon(Icons.circle,
                                    color: list[index].dishType == 2
                                        ? Colors.green
                                        : Colors.red,
                                    size: 10),
                              ],
                            ),
                            SizedBox(
                              width: Responsive.width(5, context),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    list[index].dishName!,
                                    style: TextStyle(
                                        fontSize: Responsive.width(18, context),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: Responsive.width(8, context),
                                  ),
                                  Text(
                                    "INR:${(list[index].dishPrice!).round()}",
                                    style: TextStyle(
                                        fontSize: Responsive.width(15, context),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: Responsive.width(6, context),
                                  ),
                                  Text(
                                    "${list[index].dishCalories} Calories",
                                    style: TextStyle(
                                        fontSize: Responsive.width(15, context),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: Responsive.height(40, context),
                              width: Responsive.width(110, context),
                              decoration: BoxDecoration(
                                  color: Colors.green[900],
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        ref
                                            .read(cartProvider.notifier)
                                            .removeitem(list[index]);
                                        ref
                                            .read(dishcountProvider.notifier)
                                            .state--;
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    "${list[index].itemCount}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        ref
                                            .read(cartProvider.notifier)
                                            .metadata(list[index]);
                                        ref
                                            .read(dishcountProvider.notifier)
                                            .state++;
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Responsive.width(5, context),
                            ),
                            Text(
                              "INR:${(list[index].itemCount * list[index].dishPrice!).round()}",
                              style: TextStyle(
                                  fontSize: Responsive.width(16, context),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                    const Divider(),
                    SizedBox(
                      height: Responsive.width(10, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                              fontSize: Responsive.width(20, context),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "INR:${(ref.watch(cartProvider).totalprice()).round()}",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: Responsive.width(20, context),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
      bottomNavigationBar: list.isEmpty
          ? const SizedBox()
          : Padding(
              padding: EdgeInsets.all(Responsive.width(15, context)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      minimumSize: Size(MediaQuery.sizeOf(context).width,
                          Responsive.height(60, context))),
                  onPressed: () {
                    ref.read(cartProvider.notifier).clearlist();
                    Navigator.pop(context);
                    ref.read(dishcountProvider.notifier).state = 0;

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green.shade300,
                        behavior: SnackBarBehavior.floating,
                        content: const Text("Order placed successfully")));
                  },
                  child: Text(
                    "Place Order",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive.width(16, context),
                        fontWeight: FontWeight.w500),
                  )),
            ),
    );
  }
}
