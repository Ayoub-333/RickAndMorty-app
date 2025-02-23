class Episode {
  final int episodeId;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final String created;

  Episode.fromJson(Map<String, dynamic> json)
      : episodeId = json["id"] ?? 0,
        name = json["name"] ?? "Unknown",
        airDate = json["air_date"] ?? "Unknown",
        episode = json["episode"] ?? "Unknown",
        characters = (json["characters"] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        url = json["url"] ?? "",
        created = json["created"] ?? "";
}
