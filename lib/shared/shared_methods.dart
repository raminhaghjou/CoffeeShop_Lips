part of 'shared.dart';

//(newversion image_picker, but belum ubah plugin dan add androidmanifest(sesuai newversion on github me))
// Future<File> getImage() async {
//   final _picker = ImagePicker();
//   PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     File(pickedFile.path);
//   } else {
//     print('No Image Selected');
//   }
//   return File(pickedFile.path);
// }

///Method for image_picker.
// Future<File> getImage() async {
//   var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//   return image;
// }

Future<File> getImage() async {
  final _picker = ImagePicker();
  PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    File(pickedFile.path);
  } else {
    print('No Image Selected');
  }
  return File(pickedFile.path);
}

///Future with the type of change string, to download the url in the form of a string

Future<String> uploadImage(File image) async {
  //Retrieve filename
  //The basename method is in the import path/path.dart
  String fileName = basename(image.path);
  //StorageReference will be pointed to FirebaseStorage, with child name fileName
  Reference ref = FirebaseStorage.instance.ref().child(fileName);
  //After that, the reference is given the task to upload the file.
  UploadTask task = ref.putFile(image);
  //After uploading, we take the change, task.onComplete.
  TaskSnapshot snapshot = await task;

  //Download URL if hover returns Future, then await.
  return await snapshot.ref.getDownloadURL();
}

var numberRupiah =
    NumberFormat.currency(locale: 'id-US', symbol: 'USD ', decimalDigits: 0);
