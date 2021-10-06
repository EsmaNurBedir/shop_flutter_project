class TrendingModel {
  int id;
  String productName;
  String productImage;
  String productModel;
  double productPrice;

  TrendingModel({
    this.id,
    this.productName,
    this.productPrice,
    this.productModel,
    this.productImage,
  });

    TrendingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    productModel = json['productModel'];
    productImage = json['productImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    data['productModel'] = productModel;
    data['productImage'] = productImage;

    return data;
  }
}