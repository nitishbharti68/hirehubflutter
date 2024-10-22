import 'dart:convert';

// Safely converts a JSON string into a GetJobRes object
GetJobRes getJobResFromJson(String str) {
    try {
        return GetJobRes.fromJson(json.decode(str));
    } catch (e) {
        throw Exception('Error parsing JSON: $e');
    }
}

// Converts a GetJobRes object into a JSON string
String getJobResToJson(GetJobRes data) {
    try {
        return json.encode(data.toJson());
    } catch (e) {
        throw Exception('Error encoding to JSON: $e');
    }
}

class GetJobRes {
    GetJobRes({
        required this.id,
        this.title,         // Nullable
        this.location,      // Nullable
        required this.company,
        required this.hiring,
        this.description,   // Nullable
        this.agentName,     // Nullable
        this.salary,        // Nullable
        this.period,        // Nullable
        this.contract,      // Nullable
        required this.requirements,
        required this.imageUrl,
        this.agentId,       // Nullable
        required this.updatedAt,
    });

    final String id;
    final String? title;      // Nullable
    final String? location;   // Nullable
    final String company;
    final bool hiring;
    final String? description;  // Nullable
    final String? salary;      // Nullable
    final String? period;      // Nullable
    final String? contract;    // Nullable
    final List<String> requirements;
    final String imageUrl;
    final String? agentId;     // Nullable
    final DateTime updatedAt;
    final String? agentName;   // Nullable

    factory GetJobRes.fromJson(Map<String, dynamic> json) {
        try {
            print("Parsing job data: $json"); // Log the raw JSON
            return GetJobRes(
                id: json["_id"] ?? '', // Ensure id is never null
                title: json["title"],
                location: json["location"],
                company: json["company"] ?? '', // Ensure company is never null
                hiring: json["hiring"] ?? false, // Provide a default value if null
                description: json["description"],
                salary: json["salary"],
                period: json["period"],
                agentName: json["agentName"],
                contract: json["contract"],
                requirements: json["requirements"] != null
                    ? List<String>.from(json["requirements"].map((x) => x))
                    : [], // Handle null or empty requirements
                imageUrl: json["imageUrl"] ?? '', // Ensure imageUrl is never null
                agentId: json["agentId"],
                updatedAt: json["updatedAt"] != null
                    ? DateTime.parse(json["updatedAt"])
                    : DateTime.now(), // Provide a fallback if updatedAt is null
            );
        } catch (e) {
            print("Error during parsing: $e");
            throw Exception('Error parsing JSON: $e');
        }
    }


    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "location": location,
        "company": company,
        "hiring": hiring,
        "description": description,
        "salary": salary,
        "period": period,
        "agentName": agentName,
        "contract": contract,
        "requirements": List<dynamic>.from(requirements.map((x) => x)),
        "imageUrl": imageUrl,
        "agentId": agentId,
        "updatedAt": updatedAt.toIso8601String(),
    };
}
