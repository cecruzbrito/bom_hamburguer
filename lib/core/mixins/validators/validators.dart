mixin Validators {
  String? validatorEmpty(String? value) {
    if ((value ?? "").isEmpty) return "This field is required";
    return null;
  }
}
