class Cat {
  final String id;
  final String url;

  Cat(
      {required this.id,
      required this.url,
  });

  
  static Cat fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json["id"],
      url: json["url"],
    );
  }

   Map<String, dynamic> toJson(){
    return {
      "id":id,
      "url":url,
    };
  }
}
