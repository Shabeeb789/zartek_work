import 'package:flutter/material.dart';
import 'package:zartek_work/utils/responsive.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black54,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Order Summary"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.width(16, context),
            vertical: Responsive.height(10, context)),
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                height: Responsive.height(600, context),
                width: Responsive.width(370, context),
                child: Column(
                  children: [
                    Container(
                      height: Responsive.height(65, context),
                      width: 370,
                      decoration: BoxDecoration(
                          color: const Color(0xFF063B08),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "2 Dishes-2 Items",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.width(10, context)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Responsive.height(10, context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: Responsive.height(20, context),
                          bottom: Responsive.height(20, context)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                              ),
                              child: const CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: Responsive.width(120, context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Gobi Manchurian Dry",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: Responsive.height(8, context),
                                  ),
                                  const Text(
                                    "INR 20.00",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: Responsive.height(4, context),
                                  ),
                                  const Text(
                                    "112 calories",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: Responsive.height(32, context),
                              width: Responsive.width(110, context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFF063B08)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          // itemCount < 1 ? 0 : itemCount--;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 22,
                                      )),
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: Responsive.width(10, context),
                                        color: Colors.white),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          // itemCount++;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 22,
                                      )),
                                ],
                              ),
                            ),
                            const Text(
                              "INR 20.00",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                    const Divider(
                      thickness: 2,
                      endIndent: 8,
                      indent: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: Responsive.height(20, context),
                          bottom: Responsive.height(20, context)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                              ),
                              child: const CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: Responsive.width(120, context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Gobi Manchurian Dry",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: Responsive.height(8, context),
                                  ),
                                  const Text(
                                    "INR 20.00",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: Responsive.height(4, context),
                                  ),
                                  const Text(
                                    "112 calories",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: Responsive.height(32, context),
                              width: Responsive.width(110, context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFF063B08)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          // itemCount < 1 ? 0 : itemCount--;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 22,
                                      )),
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: Responsive.width(18, context),
                                        color: Colors.white),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          // itemCount++;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 22,
                                      )),
                                ],
                              ),
                            ),
                            const Text(
                              "INR 20.00",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                    const Divider(
                      thickness: 2,
                      endIndent: 8,
                      indent: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Responsive.width(10, context),
                          vertical: Responsive.height(8, context)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Text(
                            'INR 40.00',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF063B08),
                  shape: const StadiumBorder(),
                  fixedSize: Size(Responsive.width(375, context),
                      Responsive.height(50, context)),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: Responsive.width(100, context),
                              width: Responsive.width(100, context),
                              child: Image.asset(
                                'assets/ordersuccess.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: Responsive.height(20, context),
                            ),
                            const Text(
                              "Order successfully placed",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ],
                        ),
                        actions: [
                          Center(
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFF063B08),
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Back to Home')),
                          )
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Place Order',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
    );
  }
}
