import 'dart:convert';
import 'package:the_guardian_app/models/models.dart';

class SearchResponse {

    SearchResponse({
    this.response,
    });

    Response response;

    factory SearchResponse.fromJson(String str) => SearchResponse.fromMap(json.decode(str));

    factory SearchResponse.fromMap(Map<String, dynamic> json) => SearchResponse(
        response: Response.fromMap(json["response"]),
    );
}

class Response {

    Response({
    this.status,
      this.userTier,
    this.total,
    this.startIndex,
    this.pageSize,
    this.currentPage,
    this.pages,
    this.orderBy,
    this.results,
    });

    String status;
  String userTier;
    int total;
    int startIndex;
    int pageSize;
    int currentPage;
    int pages;
    String orderBy;
    List<News> results;

    factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

    factory Response.fromMap(Map<String, dynamic> json) => Response(
        status: json["status"],
        userTier: json["userTier"],
        total: json["total"],
        startIndex: json["startIndex"],
        pageSize: json["pageSize"],
        currentPage: json["currentPage"],
        pages: json["pages"],
        orderBy: json["orderBy"],
        results: List<News>.from(json["results"].map((x) => News.fromMap(x))),
    );
}

