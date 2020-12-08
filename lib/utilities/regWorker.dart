class RegWorker {
  static String getPhoneNumber(String phoneNumber) {
    return phoneNumber.replaceAllMapped(RegExp(r'(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})'), (match) => '${match.group(1)}-${match.group(2)}-${match.group(3)}');
  }
}
