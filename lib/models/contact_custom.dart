final String tableContact = 'contacts';

class ContactFields {
  static final List<String> values = [id, name, mobile];

  static final String id = '_id';
  static final String name = 'name';
  static final String mobile = 'mobile';
}

class Contact {
  final int? id;
  final String name;
  final String mobile;

  const Contact({
    this.id,
    required this.name,
    required this.mobile,
  });

  Contact copy({
    int? id,
    String? name,
    String? mobile,
  }) =>
      Contact(
          id: id ?? this.id,
          name: name ?? this.name,
          mobile: mobile ?? this.name);

  static Contact fromJson(Map<String, Object?> json) => Contact(
      id: json[ContactFields.id] as int?,
      name: json[ContactFields.name] as String,
      mobile: json[ContactFields.mobile] as String);

  Map<String, Object?> toJson() => {
        ContactFields.id: id,
        ContactFields.name: name,
        ContactFields.mobile: mobile,
      };
}
