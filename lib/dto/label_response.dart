class LabelResponse{
  String? label;
  String? value;

  LabelResponse({this.label, this.value});

  factory LabelResponse.fromJson(Map<String, dynamic> json){
    return LabelResponse(
      label: json['labelId'],
      value: json['name']
    );
  }
}