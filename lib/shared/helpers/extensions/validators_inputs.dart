class ValidatorsInputs {
  /// Valida campos de texto en general (no vacíos, mínimo 2 caracteres, sin solo espacios)
  static String? validateGeneralField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es obligatorio';
    }
    if (value.trim().length < 2) {
      return 'Debe tener al menos 2 caracteres';
    }
    return null;
  }

  /// Valida campos de tipo Dropdown (que no sean nulos)
  static String? validateDropdown<T>(T? value) {
    if (value == null) {
      return 'Debe seleccionar una opción';
    }
    return null;
  }

  /// Valida campos numéricos (que no estén vacíos, que sean números y mayores a 0)
  static String? validatePositiveNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es obligatorio';
    }
    if (double.tryParse(value) == null) {
      return 'Ingrese un número válido';
    }
    if (double.parse(value) <= 0) {
      return 'Debe ser mayor a 0';
    }
    return null;
  }
}
