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
  // Callback function to update the quantity in the Map
  void updateQuantity(CartItem item, int newQuantity) {
    // void updateQuantity(String itemKey, int newQuantity) {
    setState(() {
      if (widget.cart != null) {
        print("newQuantity & item");
        // print(widget.cart[itemId]);
        print(newQuantity);
        print(item);
        item.quantity = newQuantity;
        print('Ny quantity på plats');
        // final cartItem = widget.cart[itemId];
        // final cartItem = widget.cart['salmonBowl'];
        // if (item != null) {
        // cartItem.quantity = newQuantity;
        // print("This is else kind of");
        // }
      } else {
        print('Somethings off');
      }
    });
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
                          _buildFoodItems(
                            widget.cart['salmonBowl']?.id ?? '0',
                            widget.cart['salmonBowl']?.heroTag ??
                                'assets/404-unsplash.jpg',
                            widget.cart["salmonBowl"]?.foodName ??
                                'Default Food Name',
                            widget.cart["salmonBowl"]?.foodPrice ?? '\$220.00',
                            widget.cart["salmonBowl"]?.quantity ?? 100,
                            widget.cart["salmonBowl"]!,
                          ),
                          _buildFoodItems(
                              widget.cart['springBowl']?.id ?? '0',
                              widget.cart['springBowl']?.heroTag ??
                                  'assets/404-unsplash.jpg',
                              widget.cart["springBowl"]?.foodName ??
                                  'Default Food Name',
                              widget.cart["springBowl"]?.foodPrice ??
                                  '\$220.00',
                              widget.cart["springBowl"]?.quantity ?? 100,
                              widget.cart["springBowl"]!),
                          _buildFoodItems(
                              widget.cart['avocadoBowl']?.id ?? '0',
                              widget.cart['avocadoBowl']?.heroTag ??
                                  'assets/404-unsplash.jpg',
                              widget.cart["avocadoBowl"]?.foodName ??
                                  'Default Food Name',
                              widget.cart["avocadoBowl"]?.foodPrice ??
                                  '\$220.00',
                              widget.cart["avocadoBowl"]?.quantity ?? 100,
                              widget.cart["avocadoBowl"]!),
                          _buildFoodItems(
                              widget.cart['berryBowl']?.id ?? '0',
                              widget.cart['berryBowl']?.heroTag ??
                                  'assets/404-unsplash.jpg',
                              widget.cart["berryBowl"]?.foodName ??
                                  'Default Food Name',
                              widget.cart["berryBowl"]?.foodPrice ?? '\$220.00',
                              widget.cart["berryBowl"]?.quantity ?? 100,
                              widget.cart["berryBowl"]!),
                          _buildFoodItems(
                              widget.cart['salmonSteak']?.id ?? '0',
                              widget.cart['salmonSteak']?.heroTag ??
                                  'assets/404-unsplash.jpg',
                              widget.cart["salmonSteak"]?.foodName ??
                                  'Default Food Name',
                              widget.cart["salmonSteak"]?.foodPrice ??
                                  '\$220.00',
                              widget.cart["salmonSteak"]?.quantity ?? 100,
                              widget.cart["salmonSteak"]!),
                          _buildFoodItems(
                              widget.cart['cowSteak']?.id ?? '0',
                              widget.cart['cowSteak']?.heroTag ??
                                  'assets/404-unsplash.jpg',
                              widget.cart["cowSteak"]?.foodName ??
                                  'Default Food Name',
                              widget.cart["cowSteak"]?.foodPrice ?? '\$220.00',
                              widget.cart["cowSteak"]?.quantity ?? 100,
                              widget.cart["cowSteak"]!),
                          // _buildFoodItems(
                          //     'assets/plate2.png', 'Spring Bowl', '\$22.00'),
                          // _buildFoodItems(
                          //     'assets/plate6.png', 'Avocado Bowl', '\$26.00'),
                          // _buildFoodItems(
                          //     'assets/plate5.png', 'Berry Bowl', '\$20.00'),
                          // _buildFoodItems(
                          //     'assets/plate3.png', 'Salmon Steak', '\$21.00'),
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

  Widget _buildFoodItems(String id, String imgPath, String foodName,
      String price, int quantity, CartItem item) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push("route");
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(
                  id: id,
                  heroTag: imgPath,
                  foodName: foodName,
                  foodPrice: price,
                  quantity: quantity,
                  item: item,
                  updateQuantity: updateQuantity)));
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
                      tag: imgPath,
                      child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75,
                        width: 75,
                      )),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      // QUANTITY FUNKAR EJ???
                      Text(
                        quantity.toString(),
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
              onPressed: () {},
              icon: const Icon(Icons.add),
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
