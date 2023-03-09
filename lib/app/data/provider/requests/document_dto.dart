

class DocumentDto{
   String? code;
   String? name;
   String? icon;
   String? type;
   bool status;
   bool isImage;
   String? path;

  DocumentDto({
    this.code,
    this.name,
    this.type,
    this.status = false,
    this.icon,
    this.isImage = false,
    this.path,
  });

   @override
  String toString() {
    return 'DocumentDto{code: $code, name: $name, icon: $icon, type: $type, status: $status, file: $isImage, path: $path}';
  }

// factory DocumentDto.fromJson(Map<String, dynamic> json) => DocumentDto(
  //   id: json["id"],
  //   name: json["name"],
  //   description: json["description"],
  //   url: json["url"],
  //   type: json["type"],
  //   status: json["status"],
  //   createdAt: json["createdAt"],
  //   updatedAt: json["updatedAt"],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "description": description,
  //   "url": url,
  //   "type": type,
  //   "status": status,
  //   "createdAt": createdAt,
  //   "updatedAt": updatedAt,
  // };

}