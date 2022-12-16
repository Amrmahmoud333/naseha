class NasehaModel {
  String? date;
  String? posterEmail;
  String? text;
  int? upVote;
  int? downVote;
  List<String>? tags;

  NasehaModel(
      {required this.date,
      required this.posterEmail,
      required this.text,
      required this.upVote,
      required this.downVote,
      required this.tags});

  NasehaModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    posterEmail = json['posterEmail'];
    text = json['text'];
    upVote = json['upVote'];
    downVote = json['downVote'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['posterEmail'] = posterEmail;
    data['text'] = text;
    data['upVote'] = upVote;
    data['downVote'] = downVote;
    data['tags'] = tags;
    return data;
  }
}
