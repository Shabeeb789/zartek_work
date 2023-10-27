import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zartek_work/providers/foodproviders.dart';
import 'package:zartek_work/providers/providers.dart';
import 'package:zartek_work/screens/cartpage.dart';
import 'package:zartek_work/services/authserviceprovider.dart';
import 'package:zartek_work/utils/responsive.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartlist = ref.watch(cartProvider).cartlist;
    final foodlist = ref.watch(foodProvider);
    final user = ref.watch(userProvider);
    return foodlist.when(
      data: (data) {
        var category = data?[0].tableMenuList;

        if (category == null) {
          return Center(child: CircularProgressIndicator());
        }
        return DefaultTabController(
          length: category.length,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.black54,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Cartpage(),
                          ));
                    },
                    icon: Stack(alignment: Alignment.topRight, children: [
                      const Icon(
                        Icons.shopping_cart,
                        size: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Text(
                          '${cartlist.length}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    ]))
              ],
              bottom: TabBar(
                  labelPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.red,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  indicatorColor: Colors.red,
                  indicatorWeight: 2.7,
                  isScrollable: true,
                  tabs: [
                    for (int i = 0; i < category.length; i++)
                      Text("${category[i].menuCategory}"),
                  ]),
            ),
            drawer: Drawer(
              width: Responsive.height(360, context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Responsive.height(240, context),
                    width: Responsive.width(360, context),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 20, 153, 24),
                          Color.fromARGB(255, 33, 237, 40),
                        ]),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: Responsive.height(32, context),
                          backgroundImage: user == null
                              ? null
                              : NetworkImage(
                                  "${user.photoURL}",
                                ),
                        ),
                        SizedBox(
                          height: Responsive.height(20, context),
                        ),
                        Text(
                          '${user?.displayName}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Responsive.height(10, context),
                        ),
                        Text(
                          'ID : ${user?.uid}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Responsive.height(10, context),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: Responsive.width(10, context)),
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey,
                        ),
                        onPressed: () async {
                          await AuthService().logout();
                          // .then((value) {data
                          //   return Navigator.pushAndRemoveUntil(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => LoginScreen(),
                          //       ),
                          //       (route) => false);
                          // });
                          await GoogleSignIn().signOut();
                          //.then((value) {
                          //   return Navigator.pushAndRemoveUntil(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => LoginScreen(),
                          //       ),
                          //       (route) => false);
                          // });
                        },
                        icon: const Icon(
                          Icons.logout,
                          size: 34,
                        ),
                        label: Padding(
                          padding: EdgeInsets.only(
                              left: Responsive.width(24, context)),
                          child: const Text(
                            "Log out",
                            style: TextStyle(fontSize: 22),
                          ),
                        )),
                  )
                ],
              ),
            ),
            body: TabBarView(children: [
              for (int page = 0; page < category.length; page++)
                ListView.separated(
                  itemCount: category[page].categoryDishes!.length,
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: category[page]
                                              .categoryDishes![index]
                                              .dishType ==
                                          2
                                      ? Colors.green
                                      : Colors.red),
                            ),
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: category[page]
                                          .categoryDishes![index]
                                          .dishType ==
                                      2
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Responsive.width(260, context),
                                child: Text(
                                  "${category[page].categoryDishes![index].dishName}",
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: Responsive.height(4, context),
                              ),
                              SizedBox(
                                width: Responsive.width(270, context),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "INR ${category[page].categoryDishes![index].dishPrice!.round()}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "${category[page].categoryDishes![index].dishCalories!.toInt()} calories",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Responsive.height(10, context),
                              ),
                              SizedBox(
                                width: Responsive.width(270, context),
                                child: Text(
                                  "${category[page].categoryDishes![index].dishDescription}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: Responsive.height(10, context),
                              ),
                              Container(
                                width: Responsive.width(120, context),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          if (ref.watch(cartProvider).itemCount(
                                                      category[page]
                                                          .categoryDishes![
                                                              index]
                                                          .dishId!) !=
                                                  null &&
                                              ref.watch(cartProvider).itemCount(
                                                      category[page]
                                                          .categoryDishes![
                                                              index]
                                                          .dishId!)! >
                                                  0) {
                                            ref
                                                .read(
                                                    dishcountProvider.notifier)
                                                .state--;
                                          }
                                          ref
                                              .read(cartProvider.notifier)
                                              .removeitem(category[page]
                                                  .categoryDishes![index]);
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        )),
                                    Text(
                                      "${ref.watch(cartProvider).itemCount(category[page].categoryDishes![index].dishId!) ?? category[page].categoryDishes![index].itemCount}",
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          ref
                                              .read(dishcountProvider.notifier)
                                              .state++;
                                          ref
                                              .read(cartProvider.notifier)
                                              .metadata(category[page]
                                                  .categoryDishes![index]);
                                        },
                                        icon: const Icon(Icons.add,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Responsive.height(8, context),
                              ),
                              category[page]
                                      .categoryDishes![index]
                                      .addonCat!
                                      .isNotEmpty
                                  ? const Text(
                                      'Customizations Available',
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : const SizedBox(),
                              SizedBox(
                                height: Responsive.height(8, context),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                                height: Responsive.height(100, context),
                                width: Responsive.width(80, context),
                                child: Image.network(
                                  category[page]
                                      .categoryDishes![index]
                                      .dishImage!,
                                  fit: BoxFit.cover,
                                )),
                          )
                        ],
                      ),
                    );
                  },
                ),
            ]),
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
