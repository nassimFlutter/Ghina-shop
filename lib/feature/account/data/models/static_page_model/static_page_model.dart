import 'dart:convert';

class StaticPage {
    bool? status;
    int? code;
    String? message;
    Page? page;

    StaticPage({
        this.status,
        this.code,
        this.message,
        this.page,
    });

    factory StaticPage.fromRawJson(String str) => StaticPage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StaticPage.fromJson(Map<String, dynamic> json) => StaticPage(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        page: json["page"] == null ? null : Page.fromJson(json["page"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "page": page?.toJson(),
    };
}

class Page {
    int? id;
    String? type;
    String? slug;
    String? image;
    String? bannerImage;
    int? views;
    DateTime? createdAt;
    String? title;
    String? description;
    dynamic keyWords;

    Page({
        this.id,
        this.type,
        this.slug,
        this.image,
        this.bannerImage,
        this.views,
        this.createdAt,
        this.title,
        this.description,
        this.keyWords,
    });

    factory Page.fromRawJson(String str) => Page.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Page.fromJson(Map<String, dynamic> json) => Page(
        id: json["id"],
        type: json["type"],
        slug: json["slug"],
        image: json["image"],
        bannerImage: json["banner_image"],
        views: json["views"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        title: json["title"],
        description: json["description"],
        keyWords: json["key_words"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "slug": slug,
        "image": image,
        "banner_image": bannerImage,
        "views": views,
        "created_at": createdAt?.toIso8601String(),
        "title": title,
        "description": description,
        "key_words": keyWords,
    };
}
