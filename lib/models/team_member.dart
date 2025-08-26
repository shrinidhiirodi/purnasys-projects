class TeamMember {
  final String name;
  final String phone;
  final String email;
  final String gst;
  final String pan;
  final String aadhar;

  const TeamMember({
    required this.name,
    required this.phone,
    required this.email,
    required this.gst,
    required this.pan,
    required this.aadhar,
  });

  TeamMember copyWith({
    String? name,
    String? phone,
    String? email,
    String? gst,
    String? pan,
    String? aadhar,
  }) {
    return TeamMember(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      gst: gst ?? this.gst,
      pan: pan ?? this.pan,
      aadhar: aadhar ?? this.aadhar,
    );
  }
}
