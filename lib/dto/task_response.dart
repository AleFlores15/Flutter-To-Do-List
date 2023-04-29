class taskResponse{
  String id;
  String name;
  String description;

  taskResponse({required this.id, required this.name, required  this.description});

  factory taskResponse.fromJson(Map<String, dynamic> json){
    return taskResponse(
      id: json['id']?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }

}