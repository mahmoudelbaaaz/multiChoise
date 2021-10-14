bool textIsNull(String userInput) {
  if (userInput.isEmpty||userInput=='+') {
    return true;
  }
  return false;
}

bool confirmTextAreEqual(String a, String b) {
  return a == b;
}

bool notEmailFormat(String email) {
  return !RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
