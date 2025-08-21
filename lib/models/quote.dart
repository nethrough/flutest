class Quote {
  final String id;
  final String content;
  final String author;
  final List<String> tags;

  Quote({
    required this.id,
    required this.content,
    required this.author,
    required this.tags,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['_id'] ?? '',
      content: json['content'] ?? '',
      author: json['author'] ?? 'Unknown',
      tags: List<String>.from(json['tags'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'content': content,
      'author': author,
      'tags': tags,
    };
  }
}