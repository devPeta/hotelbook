import 'dart:async';
import 'package:bookhotel/core/common/appsnackbarloaders.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class NetworkManager extends GetxController{
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus = ConnectivityResult.none.obs;


  ///initialize the network manager and set up a stream to continually check the connection status
  @override
  void onInit(){
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
        _updateConnectionStatus);
  }

  ///Update the connection status based on changes in connectivity and show a relevant pop up for no connection status
  Future<void> _updateConnectionStatus(
      ConnectivityResult result ) async {
    _connectivityStatus.value = result;
    if(_connectivityStatus.value == ConnectivityResult.none){
      AppLoaders.warningSnackBar(
          title:'No internet connection'
      );
    }
  }

  ///Check the internet connection status.
  ///Returns 'true' if connected, 'false' otherwise.
  Future<bool> isConnected() async {
    try{
      final result = await _connectivity.checkConnectivity();
      if(result == ConnectivityResult.none){
        return false;
      } else {
        return true;
      }
    } on PlatformException catch(_){
      return false;
    }
  }


  ///Dispose or close the active connectivity stream.
  @override
  void onClose(){
    super.onClose();
    _connectivitySubscription.cancel();
  }
}