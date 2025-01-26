const String NAME = 'Name';
const String ADDRESS = 'Address';
const String EMAIL = 'Email';
const String PHONE = 'Phone';
const String CITY = 'City';
const String PASSWORD = 'Password';
const String CONFIRMPASSWORD = 'ConfirmPassword';


void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void printResultText(String text) {
  print('\x1B[31m$text\x1B[0m');
}
