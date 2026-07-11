class ProfileFormData {
  const ProfileFormData({
    required this.name,
    required this.email,
    this.imageBase64,
  });

  final String name;
  final String email;
  final String? imageBase64;

  factory ProfileFormData.fromJson(Map<String, dynamic> json) =>
      ProfileFormData(
        name: json['name'] as String? ?? '',
        email: json['email'] as String? ?? '',
        imageBase64: json['imageBase64'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        if (imageBase64 != null) 'imageBase64': imageBase64,
      };
}