import 'dart:convert';

Product productFromJson(String raw)=>Product.fromJson(json.decode(raw));
String productToJson(Product product)=>json.encode(product.toJson());

class Product {
    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.brand,
        required this.category,
        required this.thumbnail,
        required this.images,
    });

    int id;
    String title;
    String description;
    int price;
    double discountPercentage;
    double rating;
    int stock;
    String brand;
    String category;
    String thumbnail;
    List<String> images;

    factory Product.fromJson(Map<String, dynamic> json)=> Product(id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"], discountPercentage: double.parse(json["discountPercentage"].toString()),
    rating: double.parse(json["rating"].toString()), stock: json["stock"],
    brand: json["brand"], category: json["category"],
    thumbnail: json["thumbnail"], images: json["images"].cast<String>()
    );

    Map<String,dynamic> toJson()=>{
      "id": id,
      "title":title,
      "description":description,
      "price":price,
      "discountPercentage":discountPercentage,
      "rating":rating,
      "stock":stock,
      "brand":brand,
      "category":category,
      "thumbnail":thumbnail,
      "images":images
      
    };
}
