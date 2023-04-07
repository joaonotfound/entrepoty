

import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_core/mobile_core.dart';

class ImagePickerImpl implements TakeImageUsecase {
  final imagePicker = ImagePicker();
  Future<Either<DomainError, String>> takeImage() async {
    try {
      final image = await imagePicker.pickImage(source: ImageSource.camera, imageQuality: 12);
      if(image != null){
        return Either.right(image.path);
      }
    }catch (e) {}
    return Either.left(DomainError.unexpected);
  }
}