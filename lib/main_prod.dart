import 'package:fplayer/entering_app.dart';
import 'package:fplayer/src/core/config/flavors/prod_env.dart';

void main() {
  ProdEnv.init();
  enteringApp();
}