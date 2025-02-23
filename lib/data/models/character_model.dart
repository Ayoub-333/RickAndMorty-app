class Character {
  final int charId;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Character.fromJson(Map<String, dynamic> json)
      : charId = json["id"] ?? 0,
        name = json["name"] ?? "Unknown",
        status = json["status"] ?? "Unknown",
        species = json["species"] ?? "Unknown",
        type = json["type"] ?? "",
        gender = json["gender"] ?? "Unknown",
        origin = Origin.fromJson(json["origin"] ?? {}),
        location = Location.fromJson(json["location"] ?? {}),
        image = json["image"] ?? "",
        episode = (json["episode"] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        url = json["url"] ?? "",
        created = json["created"] ?? "";
}

class Origin {
  final String name;
  final String url;

  Origin.fromJson(Map<String, dynamic> json)
      : name = json["name"] ?? "Unknown",
        url = json["url"] ?? "";
}

class Location {
  final String name;
  final String url;

  Location.fromJson(Map<String, dynamic> json)
      : name = json["name"] ?? "Unknown",
        url = json["url"] ?? "";
}
