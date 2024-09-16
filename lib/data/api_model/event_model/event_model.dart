class EventModel {
  final int id;
  final int userId;
  final String title;
  final String start;
  final String end;
  final String description;
  final String color;
  final DateTime createdAt;
  final DateTime updatedAt;

  EventModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.start,
    required this.end,
    required this.description,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create an EventModel from JSON
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      start: json['start'],
      end: json['end'],
      description: json['description'],
      color: json['color'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  @override
  String toString() {
    return 'EventModel: {title: $title, start: $start, end: $end, description: $description}';
  }
}