class Word {
  int id;

  String text;

  int usageCount;

  Word({this.id, this.text, this.usageCount = 0});

  trackUsage() {
    usageCount++;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'usageCount': usageCount,
    };
  }

  factory Word.fromMap(Map<String, dynamic> json) {
    return Word(
        id: json['id'], text: json['text'], usageCount: json['usageCount']);
  }
}
