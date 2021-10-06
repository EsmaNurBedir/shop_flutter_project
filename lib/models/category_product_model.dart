class CategoryProductModel {
   int id;
   String productName;
   String productImage;
   String productModel;

  CategoryProductModel({
    this.productImage,
    this.productModel,
    this.productName,
  });

    CategoryProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productImage = json['productImage'];
    productModel = json['productModel'];
    productName = json['productName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productImage'] = productImage;
    data['productModel'] = productModel;
    data['productName'] = productName;

    return data;
  }
}