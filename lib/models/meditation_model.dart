class Meditation {
  final int id;
  final String title;
  final String description;
  final int duration;
  final DateTime date;
  final String type;
  final int? rating;
  final String? audioLink;
  final DateTime createdAt;
  final DateTime updatedAt;

  Meditation({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.date,
    required this.type,
    this.rating,
    this.audioLink,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Meditation.fromJson(Map<String, dynamic> json) {
    return Meditation(
      id: json['meditation_id'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      date: DateTime.parse(json['date']),
      type: json['type'],
      rating: json['rating'],
      audioLink: json['audio_link'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meditation_id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'date': date.toIso8601String(),
      'type': type,
      'rating': rating,
      'audio_link': audioLink,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
