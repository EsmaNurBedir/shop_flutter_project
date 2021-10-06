import 'package:shop_flutter_project/models/cart_model.dart';
import 'package:shop_flutter_project/models/category_product_model.dart';
import 'package:shop_flutter_project/models/single_product_model.dart';
import 'package:shop_flutter_project/models/treding_model.dart';
import 'package:shop_flutter_project/services/credentials/supabase_credentials.dart';
import 'package:supabase/supabase.dart';

class SupabaseServices{
  final supabase = SupabaseClient(SupabaseCredentials.APIURL, SupabaseCredentials.APIKEY);

  Future<List<CartModel>> getCartModel() async {
    final response = await supabase.from("CartModel").select().execute();

    if (response.status == 200) {
      var cartModelList = <CartModel>[];
      for (var element in (response.data as List)) {
        CartModel anime = CartModel.fromJson(element);
        cartModelList.add(anime);
      }
      return cartModelList;
    } else {
      throw Exception("Supabase getting data error:${response.error}");
    }
  }

   Future<List<CategoryProductModel>> getCategoryProductModel() async {
    final response = await supabase.from("CategoryProductModel").select().execute();

    if (response.status == 200) {
      var categoryProductModelList = <CategoryProductModel>[];
      for (var element in (response.data as List)) {
        CategoryProductModel anime = CategoryProductModel.fromJson(element);
        categoryProductModelList.add(anime);
      }
      return categoryProductModelList;
    } else {
      throw Exception("Supabase getting data error:${response.error}");
    }
  }

   Future<List<SingleProductModel>> getSingleProductModel() async {
    final response = await supabase.from("SingleProductModel").select().execute();

    if (response.status == 200) {
      var singleProductModelList = <SingleProductModel>[];
      for (var element in (response.data as List)) {
        SingleProductModel anime = SingleProductModel.fromJson(element);
        singleProductModelList.add(anime);
      }
      return singleProductModelList;
    } else {
      throw Exception("Supabase getting data error:${response.error}");
    }
  }

    Future<List<TrendingModel>> getTrendingModel() async {
    final response = await supabase.from("TrendingModel").select().execute();

    if (response.status == 200) {
      var trendingModelList = <TrendingModel>[];
      for (var element in (response.data as List)) {
        TrendingModel anime = TrendingModel.fromJson(element);
        trendingModelList.add(anime);
      }
      return trendingModelList;
    } else {
      throw Exception("Supabase getting data error:${response.error}");
    }
  }

}