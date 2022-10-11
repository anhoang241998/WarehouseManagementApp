class FieldUtils {
  static bool isEmptyField(String value) => value == '';

  static bool isSelectBlock(String value) => value != 'Select Block';

  static bool isSelectPosition(String value) => value != 'Select Position';

  static bool isSelectFloor(String value) => value != 'Select Floor';
}
