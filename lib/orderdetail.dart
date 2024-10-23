import 'package:flutter/material.dart';
import 'package:foodapp/components/most_button.dart';
import 'package:foodapp/findlocatoin.dart';
import 'package:foodapp/modals/orderable.dart';

class OrderPage extends StatefulWidget {
  final List<Order>? data; // Orders passed from MenuScreen
  const OrderPage({super.key, this.data});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

// final ref = FirebaseDatabase.instance.ref('Orders');

class _OrderPageState extends State<OrderPage> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("asessts/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    "Order Detail",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return _bottomSheet();
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.deepPurple),
                        color: Colors.transparent,
                      ),
                      child: const Text(
                        "Show Checkout",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: widget.data != null && widget.data!.isNotEmpty
                    ? 
                           ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.data!.length,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 135,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: widget.data![index].image,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, top: 17),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "RS:${widget.data![index].priceOfProduct.toString()}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          widget.data![index].titleofProduct
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          widget.data![index].subTitle
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            // Quantity controls
                                            Row(
                                              children: [
                                                // Decrease Quantity Button
                                                Container(
                                                  width: 20,
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 7.9,
                                                    right: 3,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(5),
                                                      bottomLeft:
                                                          Radius.circular(5),
                                                    ),
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (quantity >= 1) {
                                                          quantity--;
                                                        }
                                                      });
                                                    },
                                                    child: const Text(
                                                      "-",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                                // Display Quantity
                                                Container(
                                                  width: 20,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6,
                                                          right: 3,
                                                          top: 4.5,
                                                          bottom: 4.5),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.grey,
                                                  ),
                                                  child:
                                                      Text(quantity.toString()),
                                                ),
                                                // Increase Quantity Button
                                                Container(
                                                  width: 20,
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 3.6,
                                                    right: 3,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(5),
                                                      bottomRight:
                                                          Radius.circular(5),
                                                    ),
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        quantity++;
                                                      });
                                                    },
                                                    child: const Text(
                                                      "+",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 80,
                                            ),
                                            // Delete Item Icon
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  widget.data!.removeAt(index);
                                                });
                                                // ref.child().remove();
                                              },
                                              child: const Icon(
                                                Icons.delete_outline,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                       
                    : const Center(
                        child: Text(
                          "There is no Order",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Bottom sheet displaying total price and checkout
  Widget _bottomSheet() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Color(0xff1D102D)),
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 22,
          ),
          const Text(
            "SubTotal             RS:540",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Deleivery             Rs:439",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 216, 206, 206)),
          ),
          const SizedBox(
            height: 63,
          ),
          MostButton(text: "CheckOut", onTap: () {
            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FindLocation()),
                        );
          })
        ],
      ),
    );
  }
}





























// class Orderdetail extends StatefulWidget {
//   @override
//   _OrderDetailPageState createState() => _OrderDetailPageState();
// }

// class _OrderDetailPageState extends State<Orderdetail> {
//   int saladCount = 2;
//   int curryCount = 2;
//   int friesCount = 2;

//   @override
//   Widget build(BuildContext context) {
//     double saladPrice = 52.00;
//     double curryPrice = 23.00;
//     double friesPrice = 21.00;
//     double subtotal = (saladPrice * saladCount) +
//         (curryPrice * curryCount) +
//         (friesPrice * friesCount);
//     double deliveryFee = 2.00;
//     double total = subtotal + deliveryFee;

//     return Scaffold(
//       backgroundColor: Color(0xFF1A1A2E),
//       appBar: AppBar(
//         title: Text('Order detail'),
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.deepPurple.shade900,
//               Colors.black,
//             ],
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView(
//                   children: [
//                     buildOrderItem(
//                       'Chicken Veggi Salad',
//                       'With cheese sauce',
//                       saladPrice,
//                       'asessts/product image (1).png', // Replace with correct image path
//                       saladCount,
//                       (newCount) => setState(() => saladCount = newCount),
//                     ),
//                     buildOrderItem(
//                       'Nutton Curry',
//                       'With basmati rice',
//                       curryPrice,
//                       'asessts/product image.png', // Replace with correct image path
//                       curryCount,
//                       (newCount) => setState(() => curryCount = newCount),
//                     ),
//                     buildOrderItem(
//                       'French Fry',
//                       'With beef bacon',
//                       friesPrice,
//                       'asessts/product image (2).png', // Replace with correct image path
//                       friesCount,
//                       (newCount) => setState(() => friesCount = newCount),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               buildPriceDetails(subtotal, deliveryFee, total),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                     Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => FindLocation(),
//                     ),
//                   );
//                 },
//                 child: Text('Checkout'),
//                 style: ElevatedButton.styleFrom(
//                   iconColor: const Color.fromARGB(255, 249, 252, 255), // Blue button background
//                           backgroundColor: const Color.fromARGB(255, 131, 182, 233),

//                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                     minimumSize: Size(double.infinity, 40),
//                   textStyle: TextStyle(fontSize: 18.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.0),
                    
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildOrderItem(String title, String subtitle, double price,
//       String imageUrl, int count, ValueChanged<int> onChanged) {
//     return Card(
//       color: Colors.black26,
//       child: ListTile(
//         leading: Image.asset(
//           imageUrl,
//           width: 50,
//           height: 50,
//           fit: BoxFit.cover,
//         ),
//         title: Text(
//           title,
//           style: TextStyle(color: Colors.white),
//         ),
//         subtitle: Text(
//           subtitle,
//           style: TextStyle(color: Colors.grey),
//         ),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               icon: Icon(Icons.remove, color: Colors.white),
//               onPressed: () {
//                 if (count > 1) {
//                   onChanged(count - 1);
//                 }
//               },
//             ),
//             Text(
//               '$count',
//               style: TextStyle(fontSize: 18, color: Colors.white),
//             ),
//             IconButton(
//               icon: Icon(Icons.add, color: Colors.white),
//               onPressed: () {
//                 onChanged(count + 1);
//               },
//             ),
//             SizedBox(width: 8),
//             Text(
//               '\$$price',
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//             IconButton(
//               icon: Icon(Icons.delete, color: Colors.red),
//               onPressed: () {
//                 // Handle delete item
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildPriceDetails(double subtotal, double delivery, double total) {
//     return Column(
//       children: [
//         buildPriceRow('Subtotal', subtotal),
//         buildPriceRow('Delivery', delivery),
//         Divider(color: Colors.grey),
//         buildPriceRow('Total', total, isTotal: true),
//       ],
//     );
//   }

//   Widget buildPriceRow(String label, double amount, {bool isTotal = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: isTotal ? 18 : 16,
//               fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
//               color: isTotal ? Colors.white : Colors.grey,
//             ),
//           ),
//           Text(
//             '\$${amount.toStringAsFixed(2)}',
//             style: TextStyle(
//               fontSize: isTotal ? 18 : 16,
//               fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
//               color: isTotal ? Colors.white : Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
