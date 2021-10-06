class SingleProductModel {
  int id;
  String productName;
  String productImage;
  String productModel;
  int productPrice;
  int productOldPrice;
  String productSecondImage;
  String productThirdImage;
  String productFourImage;
  SingleProductModel({
    this.id,
    this.productThirdImage,
    this.productFourImage,
    this.productImage,
    this.productModel,
    this.productName,
    this.productOldPrice,
    this.productPrice,
    this.productSecondImage,
  });

    SingleProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productThirdImage = json['productThirdImage'];
    productFourImage = json['productFourImage'];
    productImage = json['productImage'];
    productModel = json['productModel'];
    productName = json['productName'];
    productOldPrice = json['productOldPrice'];
    productPrice = json['productPrice'];
    productSecondImage = json['productSecondImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productThirdImage'] = productThirdImage;
    data['productFourImage'] = productFourImage;
    data['productImage'] = productImage;
    data['productModel'] = productModel;
    data['productName'] = productName;
    data['productOldPrice'] = productOldPrice;
    data['productPrice'] = productPrice;
    data['productSecondImage'] = productSecondImage;

    return data;
  }
}