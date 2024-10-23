import 'package:flutter/material.dart';
import 'package:foodapp/components/most_button.dart';
import 'package:foodapp/modals/orderable.dart';
import 'package:foodapp/orderdetail.dart';



class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Order> existing = []; // List of existing orders
  bool loading = false;
  // final databaseRef = FirebaseDatabase.instance.ref('Orders');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("asessts/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage("asessts/Image.png"),
                  ),
                  // Top Action Bar
                  Positioned(
                    top: 10,
                    child: Container(
                      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: SizedBox(
                        height: 50,
                        width: 340,
                        child: Row(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.details,
                                color: Colors.white,
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                  ),
                  // Product Info Card
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 250, left: 20, right: 20),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 173, 165, 165),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color(0xff2B2A60),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              height: 89.5,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Udan Miso",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "16:Rs",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Product Description
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 7),
                              child: Column(
                                children: [
                                  Text(
                                    "Our Udon Miso is a comforting bowl of thick, handmade udon noodles in a rich miso broth, garnished with tofu, spring onions, and vegetables.",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
              ),
              // Noodle Type
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Noodle Type",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 150,
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: ListView.builder(
                      itemBuilder: _buildCardforNoodleType,
                      itemCount: 9,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Add to Basket Button
                  MostButton(
                    text: "Add to Basket",
                    onTap: () {
                      onSave(context, existing);
               
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to add order and navigate to OrderPage
  void onSave(BuildContext context, List<Order> existingList) {
    // Create new order
    var data = Order(
      Image(
        image: AssetImage("asessts/Image.png"),
      ),
      "Udon Miso",
      16, // Price
      "Delicious", // Subtitle
    );
    // Add order to the list
    existingList.add(data);
    // Navigate to OrderPage with the updated list
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(data: existingList),
      ),
    );
  }

  // Function to build list of noodle types
  Widget _buildCardforNoodleType(BuildContext context, int index) {
    return Row(
      children: [
        Text(
          "Thin",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Spacer(),
        Checkbox(
            value: true,
            onChanged: (value) {
              setState(() {
                value = value;
              });
            })
      ],
    );
  }
}

// class MenuScreen extends StatefulWidget {
//   @override
//   _MenuScreenState createState() => _MenuScreenState();
// }

// class _MenuScreenState extends State<MenuScreen> {
//   int quantity = 1;
//   String? selectedNoodleType;
//   final noodleTypes = ['Thin', 'Thick', 'Udon'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//          backgroundColor: Color.fromARGB(255, 0, 0, 0),
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             icon: Icon(Icons.favorite_border, color: const Color.fromARGB(255, 19, 19, 19)),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(Icons.more_vert, color: const Color.fromARGB(255, 9, 9, 9)),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Colors.deepPurple.shade900,
//                 Colors.black,
//               ],
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Restaurant Image
//                 Container(
//                   height: 250,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('asessts/Image.png'), // Corrected path
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Colors.black.withOpacity(0.5),
//                           Colors.transparent
//                         ],
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.topCenter,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // Restaurant Info
//                 Text(
//                   'Udon Miso',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   '\$16.00',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Our Udon Miso is a comforting bowl of thick, handmade udon noodles '
//                   'in a rich miso broth, garnished with tofu, spring onions, and vegetables.',
//                   style: TextStyle(color: Colors.white70),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Quantity',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     SizedBox(width: 20),
//                     Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             setState(() {
//                               if (quantity > 1) quantity--;
//                             });
//                           },
//                           icon: Icon(Icons.remove, color: Colors.white),
//                         ),
//                         Text(
//                           quantity.toString(),
//                           style:
//                               TextStyle(color: Colors.white, fontSize: 18),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             setState(() {
//                               quantity++;
//                             });
//                           },
//                           icon: Icon(Icons.add, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Noodle type',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 SizedBox(height: 10),
//                 DropdownButtonFormField<String>(
//                   dropdownColor: Colors.black,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[850],
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white, width: 1),
//                     ),
//                   ),
//                   value: selectedNoodleType,
//                   hint: Text(
//                     'Select noodle type',
//                     style: TextStyle(color: Colors.white70),
//                   ),
//                   items: noodleTypes.map((noodle) {
//                     return DropdownMenuItem<String>(
//                       value: noodle,
//                       child: Text(noodle, style: TextStyle(color: Colors.white)),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       selectedNoodleType = value;
//                     });
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 Center(
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.all(16),
//                                   backgroundColor: const Color.fromARGB(255, 131, 182, 233),


//                       ),
//                       onPressed: () {
//                         // Navigate to the Basket screen
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Orderdetail()),
//                         );
//                       },
//                       child: Text(
//                         'Add to Basket',
//                         style: TextStyle(fontSize: 18),
                      
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BasketScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text('Your Basket', style: TextStyle(color: Colors.white)),
//       ),
//       body: Center(
//         child: Text(
//           'Items in your basket',
//           style: TextStyle(color: Colors.white, fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
