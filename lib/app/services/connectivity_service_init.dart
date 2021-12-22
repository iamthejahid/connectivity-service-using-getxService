import 'package:get/get.dart';
import 'package:getx_service_of_connectivity/app/services/connectivity_service.dart';

Future<void> connctivityServiceInit() async {
  Future.delayed(
    const Duration(seconds: 3),
    //the connectivity package contain some limitaion,
    //if you call the Connectivity instance befor app rendering, the connectivity will return null value.
    //So we forcefully stopped here for 3 second, another bad approach!
    () async => await Get.putAsync<ConnectivityService>(
      // ignore: await_only_futures
      () async => await ConnectivityService(),
    ),
  );
}
