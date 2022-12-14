class TextFieldValidators {
  static const requiredFiledError = 'Esse campo é obrigatório.';

  static String? validateNotEmpty(String? text) {
    if (text != null) {
      if (text.isEmpty) return requiredFiledError;
    }
    return null;
  }

  static String? validateNotZero(num value) {
    if (value == 0) {
      return 'O deve ser maior que 0.';
    }
    return null;
  }

  static String? noValidation(String? text) {
    return null;
  }
}
