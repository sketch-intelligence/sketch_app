class Authority {
  String? authority;

  Authority({this.authority});

  factory Authority.fromJson(Map<String, dynamic> json) => Authority(
        authority: json['authority'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'authority': authority,
      };
}
