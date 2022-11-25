
import 'dart:convert';

AllContacts allContactsFromJson(String str) => AllContacts.fromJson(json.decode(str));


class AllContacts {
    AllContacts({
      required this.errorFlag,
      required this.message,
      required this.data,
    });

    final String errorFlag;
    final String message;
    final Data data;

    factory AllContacts.fromJson(Map<String, dynamic> json) => AllContacts(
        errorFlag: json["error_flag"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

}

class Data {
    Data({
        required this.contacts,
        required this.invites,
    });

    final List<Contact> contacts;
    final List<Invite> invites;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
        invites: List<Invite>.from(json["invites"].map((x) => Invite.fromJson(x))),
    );
}

class Contact {
    Contact({
        required this.contactId,
        required this.email,
        required this.firstname,
        required this.lastname,
        required this.mobile,
        required this.dob,
        required this.contactAddressLine1,
        required this.contactAddressLine2,
        required this.city,
        required this.countyId,
        required this.countryId,
        required this.isactive,
        required this.role,
        required this.roleName,
    });

    final String? contactId;
    final String? email;
    final String? firstname;
    final String? lastname;
    final String? mobile;
    final DateTime? dob;
    final String? contactAddressLine1;
    final String? contactAddressLine2;
    final String? city;
    final dynamic countyId;
    final dynamic countryId;
    final bool isactive;
    final int role;
    final Name? roleName;

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        contactId: json["contact_id"],
        email: json["email"],
        firstname: json["firstname"] ,
        lastname: json["lastname"],
        mobile: json["mobile"] ??'',
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        contactAddressLine1: json["contact_address_line_1"]??'',
        contactAddressLine2: json["contact_address_line_2"]??'',
        city: json["city"]??'',
        countyId: json["county_id"],
        countryId: json["country_id"],
        isactive: json["isactive"],
        role: json["role"],
        roleName: nameValues.map![json["role_name"]],
    );

   
}

enum Name { ADMIN, PREPARER, VIEWER, EMPLOYEE, APPROVER }

final nameValues = EnumValues({
    "Admin": Name.ADMIN,
    "Approver": Name.APPROVER,
    "Employee": Name.EMPLOYEE,
    "Preparer": Name.PREPARER,
    "Viewer": Name.VIEWER
});

class Invite {
    Invite({
        required this.inviteId,
        required this.email,
        required this.configName,
    });

    final String inviteId;
    final String email;
    final Name? configName;

    factory Invite.fromJson(Map<String, dynamic> json) => Invite(
        inviteId: json["invite_id"],
        email: json["email"],
        configName: nameValues.map![json["config_name"]],
    );

 
}

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map?.map((k, v) =>  MapEntry(v, k));
        return reverseMap!;
    }
}
