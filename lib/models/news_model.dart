
import 'dart:convert';

class News {
    News({
    this.id,
    this.type,
    this.sectionId,
    this.sectionName,
    this.webPublicationDate,
    this.webTitle,
    this.webUrl,
    this.apiUrl,
    this.fields,
    this.isHosted,
       this.pillarId,
       this.pillarName,
    });

    String id;
    String type;
    String sectionId;
    String sectionName;
    DateTime webPublicationDate;
    String webTitle;
    String webUrl;
    String apiUrl;
    Fields fields;
    bool isHosted;
  String pillarId;
  String pillarName;

    factory News.fromJson(String str) => News.fromMap(json.decode(str));

    factory News.fromMap(Map<String, dynamic> json) => News(
        id: json["id"],
        type: json["type"],
        sectionId: json["sectionId"],
        sectionName: json["sectionName"],
        webPublicationDate: DateTime.parse(json["webPublicationDate"]),
        webTitle: json["webTitle"],
        webUrl: json["webUrl"],
        apiUrl: json["apiUrl"],
        fields: Fields.fromMap(json["fields"]),
        isHosted: json["isHosted"],
        pillarId: json["pillarId"],
        pillarName: json["pillarName"],
    );
}

class Fields {
    Fields({
       this.body, this.headline, this.thumbnail, this.bodyText, this.trailText
    });

    String body;
    String headline;
    String thumbnail;
    String bodyText;
    String trailText;

    factory Fields.fromJson(String str) => Fields.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Fields.fromMap(Map<String, dynamic> json) => Fields(
        headline: json["headline"],
        thumbnail: json["thumbnail"],
        bodyText: json["bodyText"],
        body: json['body'],
        trailText: json['trailText'],

    );

    Map<String, dynamic> toMap() => {
        "headline": headline,
        "thumbnail": thumbnail,
        "bodyText": bodyText,
        "body": body,
        "trailText": trailText
    };
}


