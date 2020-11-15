class Word {
  String text;

  int usageCount;

  Word({this.text, this.usageCount = 0});

  trackUsage() {
    usageCount++;
  }
}
