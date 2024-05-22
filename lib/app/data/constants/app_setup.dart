

// import 'file_service.dart';
import 'permissions.dart';

class AppSetup {
  static setup() async {
    print('here in app setup');
    await Permissions.setup();
    // await FileService.ensureReady();
  }
}
