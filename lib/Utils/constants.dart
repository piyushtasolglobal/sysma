import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loading{
  onLoading()async{
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.none,
    );
  }
  onDone() async {
    await EasyLoading.dismiss();
  }

  onSuccess({msg})async{
    await EasyLoading.showSuccess('$msg');
  }

  onError({msg})async{
    await EasyLoading.showInfo('$msg');
  }
  showToast({msg})async{
    await EasyLoading.showToast(
      '$msg',
    );
  }
}