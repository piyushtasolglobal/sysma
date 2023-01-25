
import 'package:connectivity_plus/connectivity_plus.dart';

class NetConnectivity{
  Future<bool>conn()async{
    bool netConn = false;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print(result.name);
      if(result.name == 'wifi' || result.name == 'mobile'){
        netConn=true;
      }else{
        netConn=false;
      }
    });
    return netConn;
  }
}
