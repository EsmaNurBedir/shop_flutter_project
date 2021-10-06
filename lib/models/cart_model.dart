class CartModel {
   int id;
   String productImage;
   String productName;
   String productModel;
   double productOldPrice;
   double productPrice;
   String productSize;
   String productColor;
   String productQuantity;

  CartModel({
    this.id,
    this.productName,
    this.productImage,
    this.productModel,
    this.productOldPrice,
    this.productPrice,
    this.productColor,
    this.productQuantity,
    this.productSize,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    productImage = json['productImage'];
    productModel = json['productModel'];
    productOldPrice = json['productOldPrice'];
    productPrice = json['productPrice'];
    productColor = json['productColor'];
    productQuantity = json['productQuantity'];
    productSize = json['productSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['productImage'] = productImage;
    data['productModel'] = productModel;
    data['productOldPrice'] = productOldPrice;
    data['productPrice'] = productPrice;
    data['productColor'] = productColor;
    data['productQuantity'] = productQuantity;
    data['productSize'] = productSize;

    return data;
  }
}