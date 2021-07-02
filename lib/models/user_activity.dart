class UserActivity {
  final String title;
  final String id;
  DateTime dateTime = DateTime.now();
  UserActivity(this.title, this.id);
  UserActivity.fromJson(Map<String, dynamic> json)
      : title = json['displayName'],
        id = json['id'];
}
