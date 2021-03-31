import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final _storage = FirebaseStorage.instanceFor(
      bucket: 'educationapp-45eaa.appspot.com'
  );

  Future<String> downloadURLExample() async {
    var downloadURL = await _storage
        .ref()
        .child('table_manners')
        .child('KubeCon_EU_2020_VirtualBackgrounds-4-scaled.jpg')
        .getDownloadURL();
    return downloadURL;
  }

  Future<String> downloadVideoURLExample() async {
    var downloadURL = await _storage
        .ref()
        .child('table_manners')
        .child('video.mp4')
        .getDownloadURL();
    return downloadURL;
  }
}