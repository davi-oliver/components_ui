library quadrant_components;

export 'src/qt_requests.dart';

export 'widgets/ui_kits/kit_text_field.dart';
export 'widgets/ui_kits/kit_appbars.dart';
export 'widgets/ui_kits/kit_buttons.dart';
export 'widgets/ui_kits/kit_loading.dart';

class ClassTeste {
  String teste1({required int val}) {
    if (val > 6) return "Passou";
    if (val > 0) return "Reprovado";
    return "error";
  }
}
