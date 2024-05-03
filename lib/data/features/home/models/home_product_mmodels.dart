class ProductDataModel {
  final String id;
   bool isLiked;
   bool isWished;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  ProductDataModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.isLiked,
      required this.isWished});
}
