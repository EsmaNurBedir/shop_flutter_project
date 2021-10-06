import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shop_flutter_project/services/notifier/authentication_notifier.dart';

class AppProviders{
 static List<SingleChildWidget> providers = [
   ChangeNotifierProvider(create: (_)=> AuthenticationNotifier())
 ];
}