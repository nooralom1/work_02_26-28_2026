import 'dart:convert';

class AllCourseListModel {
  Courses? courses;

  AllCourseListModel({this.courses});

  factory AllCourseListModel.fromRawJson(String str) =>
      AllCourseListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllCourseListModel.fromJson(Map<String, dynamic> json) =>
      AllCourseListModel(
        courses: json["courses"] == null
            ? null
            : Courses.fromJson(json["courses"]),
      );

  Map<String, dynamic> toJson() => {"courses": courses?.toJson()};
}

class Courses {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Courses({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Courses.fromRawJson(String str) => Courses.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
    currentPage: json["current_page"],
    data: json["data"] == null
        ? []
        : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: json["links"] == null
        ? []
        : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": links == null
        ? []
        : List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  int? id;
  String? featuredVideoUrl;
  String? title;
  String? subTitle;
  String? price;
  String? banner;
  String? slug;
  String? discountAmount;
  String? startingDateTime;
  String? admissionLastDate;
  String? discountStartDate;
  String? discountEndDate;
  String? isPaid;
  String? courseEnrollStatus;

  Datum({
    this.id,
    this.featuredVideoUrl,
    this.title,
    this.subTitle,
    this.price,
    this.banner,
    this.slug,
    this.discountAmount,
    this.startingDateTime,
    this.admissionLastDate,
    this.discountStartDate,
    this.discountEndDate,
    this.isPaid,
    this.courseEnrollStatus,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    featuredVideoUrl: json["featured_video_url"],
    title: json["title"],
    subTitle: json["sub_title"],
    price: json["price"],
    banner: json["banner"],
    slug: json["slug"],
    discountAmount: json["discount_amount"],
    startingDateTime: json["starting_date_time"],
    admissionLastDate: json["admission_last_date"],
    discountStartDate: json["discount_start_date"],
    discountEndDate: json["discount_end_date"],
    isPaid: json["is_paid"],
    courseEnrollStatus: json["courseEnrollStatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "featured_video_url": featuredVideoUrl,
    "title": title,
    "sub_title": subTitle,
    "price": price,
    "banner": banner,
    "slug": slug,
    "discount_amount": discountAmount,
    "starting_date_time": startingDateTime,
    "admission_last_date": admissionLastDate,
    "discount_start_date": discountStartDate,
    "discount_end_date": discountEndDate,
    "is_paid": isPaid,
    "courseEnrollStatus": courseEnrollStatus,
  };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({this.url, this.label, this.active});

  factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Link.fromJson(Map<String, dynamic> json) =>
      Link(url: json["url"], label: json["label"], active: json["active"]);

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
