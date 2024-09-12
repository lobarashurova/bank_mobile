class NewsModel {
  int? id;
  String title;
  String text;
  String? imageUrl;

  NewsModel(
      {this.id,
      required this.title,
      required this.text,
      required this.imageUrl});
}
