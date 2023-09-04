class CartItem {
  final String id;
  final String heroTag;
  final String foodName;
  final String foodPrice;
  int quantity;

  CartItem({
    required this.id,
    required this.heroTag,
    required this.foodName,
    required this.foodPrice,
    this.quantity = 0,
  });
}
