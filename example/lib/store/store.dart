import 'package:mobx/mobx.dart';
part 'store.g.dart';

class StoreImages = _StoreImgesBaase with _$StoreImages;

abstract class _StoreImgesBaase with Store {
  ObservableList listImages = ObservableList();

  @action
  void setList(_value) {
    listImages.clear();
    listImages.addAll(_value);
  }
}
