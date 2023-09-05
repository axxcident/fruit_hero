import 'package:flutter/material.dart';
import 'package:fruit_hero/detailsPage.dart';
import 'cart_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, CartItem> cart = {
    'salmonBowl': CartItem(
      id: '1',
      heroTag: 'assets/plate1.png',
      foodName: 'Salmon Bowl',
      foodPrice: '\$24.00',
      quantity: 0,
    ),
    'springBowl': CartItem(
      id: '2',
      heroTag: 'assets/plate2.png',
      foodName: 'Spring Bowl',
      foodPrice: '\$22.00',
      quantity: 0,
    ),
    'avocadoBowl': CartItem(
      id: '3',
      heroTag: 'assets/plate3.png',
      foodName: 'Avocado Bowl',
      foodPrice: '\$20.00',
      quantity: 0,
    ),
    'berryBowl': CartItem(
      id: '4',
      heroTag: 'assets/plate4.png',
      foodName: 'Berry Bowl',
      foodPrice: '\$26.00',
      quantity: 0,
    ),
    'salmonSteak': CartItem(
      id: '5',
      heroTag: 'assets/plate5.png',
      foodName: 'Salmon Steak',
      foodPrice: '\$21.00',
      quantity: 0,
    ),
    'cowSteak': CartItem(
      id: '6',
      heroTag: 'assets/plate6.png',
      foodName: 'Cow Steak',
      foodPrice: '\$29.99',
      quantity: 0,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(cart: cart),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Map<String, CartItem> cart;

  const MyHomePage({Key? key, required this.cart}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Summan Cart items
// int totalItemsInCart = cart.values.fold(0, (sum, item) => sum + item.quantity);

class _MyHomePageState extends State<MyHomePage> {
  int cartItemCount = 0;

  void updateQuantity(CartItem item, int newQuantity) {
    setState(() {
      if (widget.cart != null) {
        item.quantity = newQuantity;
        updateCartItemCount();
      } else {
        print('Somethings off');
      }
    });
  }

  void updateCartItemCount() {
    int count = 0;
    widget.cart.values.forEach((item) {
      count += item.quantity;
    });
    cartItemCount = count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21BFBD),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                // SizedBox? eller Container
                SizedBox(
                  width: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Text(
                  "Healthy",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
                SizedBox(width: 10),
                Text(
                  "Food",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 25),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(
            // height: MediaQuery.of(context).size.height,
            height: MediaQuery.of(context).size.height - 185,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75))),
            child: ListView(
              primary: false,
              padding: const EdgeInsets.only(left: 25, right: 20),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Center(
                    child: Container(
                      width: 700,
                      // alignment: Alignment.center,
                      // Lägg till Max-width? Ta bort "DeNNA GJORDE JAG"------
                      height: MediaQuery.of(context).size.height - 300,
                      child: ListView(
                        children: [
                          _buildFoodItems(widget.cart["salmonBowl"]!),
                          _buildFoodItems(widget.cart["springBowl"]!),
                          _buildFoodItems(widget.cart["avocadoBowl"]!),
                          _buildFoodItems(widget.cart["berryBowl"]!),
                          _buildFoodItems(widget.cart["salmonSteak"]!),
                          _buildFoodItems(widget.cart["cowSteak"]!),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Stack(children: [
                      Container(
                        // Challenge, addera en tvåa här i övre höger hörn.
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Icon(
                            Icons.shopping_basket,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      if (cartItemCount > 0)
                        Positioned(
                            top: 5,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                cartItemCount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ))
                    ]),
                    Container(
                      height: 65,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1),
                          color: const Color(0xFF1C1428),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItems(CartItem item) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push("route");
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  DetailsPage(item: item, updateQuantity: updateQuantity)));
        },
        child: Row(
          // mainAxisAlignment DENNA GJORDE JAG NU --------------------
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Remove container?
            Container(
              child: Row(
                children: [
                  Hero(
                      tag: item.heroTag,
                      child: Image(
                        image: AssetImage(item.heroTag),
                        fit: BoxFit.cover,
                        height: 75,
                        width: 75,
                      )),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.foodName,
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        item.foodPrice,
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      Text(
                        item.quantity.toString(),
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (widget.cart != null) {
                    item.quantity += 1;
                    updateCartItemCount();
                  } else {
                    print('Somethings off');
                  }
                });
              },
              icon: const Icon(Icons.add),
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
