
// ignore_for_file: public_member_api_docs, sort_constructors_first
class Address {
  final String? id;
  final String? firstName;
  final String? lastName;
  final int? phoneNumber;
  final String? address;
  final String? city;

  Address({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.address,
    this.city,
  });



  Address.fromJson(Map<String, dynamic>? json,
  ) : this(
          id: (json!['id'] as  String),
          firstName: (json['firstName'] as  String) ,
          lastName: (json['lastName'] as  String),
          phoneNumber: (json['phoneNumber'] as int),
          address: (json['address'] as String),
          city: (json['city'] as String),
        );

  // {
  //   final data = snapshot.data();
  //   return Address(
  //     id: data!['id'],
  //     firstName: data['firstName'],
  //     lastName: data['lastName'],
  //     phoneNumber:data['phoneNumber'],
  //     address: data['address'],
  //     city: data['city'],
  //   );
  // }

  Map<String, Object?> toJson() {
    return {
      if (id != null) 'id': id,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
    };
  }

}
