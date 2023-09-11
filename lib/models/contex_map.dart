class ContextMap {
  String? id;
  String? mapboxId;
  String? text;
  String? wikidata;
  String? shortCode;

  ContextMap({
    this.id,
    this.mapboxId,
    this.text,
    this.wikidata,
    this.shortCode,
  });

  ContextMap copyWith({
    String? id,
    String? mapboxId,
    String? text,
    String? wikidata,
    String? shortCode,
  }) =>
      ContextMap(
        id: id ?? this.id,
        mapboxId: mapboxId ?? this.mapboxId,
        text: text ?? this.text,
        wikidata: wikidata ?? this.wikidata,
        shortCode: shortCode ?? this.shortCode,
      );

  factory ContextMap.fromJson(Map<String, dynamic> json) => ContextMap(
        id: json["id"],
        mapboxId: json["mapbox_id"],
        text: json["text"],
        wikidata: json["wikidata"],
        shortCode: json["short_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mapbox_id": mapboxId,
        "text": text,
        "wikidata": wikidata,
        "short_code": shortCode,
      };
}
