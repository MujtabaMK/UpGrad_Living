// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getBedsModel = try? JSONDecoder().decode(GetBedsModel.self, from: jsonData)

import Foundation

// MARK: - MealListModel
struct MealListModel: Codable {
    let status: Int?
    let msg: String?
    let data: HomeClass?
}

// MARK: - DataClass
struct HomeClass: Codable {
    let meal: [Meal]?
    let note: [Note]?
    let event: [Event]?
    let roomies: [Roomy]?
    let offer: [Offer]?
    let profile: Profile?
}

// MARK: - Event
struct Event: Codable, Identifiable {
    let id, eventCateg, eventName, startDate: String?
    let startTime, endTime, endDate, location: String?
    let description: String?
    let eventImg: String?
    let totalSeats, createdAt, categID, categName: String?
    let day, month, timeStart, fulldate: String?
    let isFavorate, availableSeats, isTicketBooked: String?
    let qrURL: String?
    let ticketPDF,fulltimewithdate: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "hos_event_id"
        case eventCateg = "event_categ"
        case eventName = "event_name"
        case startDate = "start_date"
        case startTime = "start_time"
        case endTime = "end_time"
        case endDate = "end_date"
        case location, description
        case eventImg = "event_img"
        case totalSeats = "total_seats"
        case createdAt = "created_at"
        case categID = "categ_id"
        case categName = "categ_name"
        case day, month
        case timeStart = "time_start"
        case fulldate, isFavorate, availableSeats, isTicketBooked
        case qrURL = "qrUrl"
        case ticketPDF = "ticketPdf"
        case fulltimewithdate
    }
}

// MARK: - Meal
struct Meal: Codable, Identifiable {
    let id, mealName, foodTime: String?
    let foodImage: String?
    let food: [Food]?
    
    enum CodingKeys: String, CodingKey {
        case id = "rel_id"
        case mealName = "meal_name"
        case foodTime = "food_time"
        case foodImage = "food_image"
        case food
    }
}

// MARK: - Food
struct Food: Codable, Identifiable {
    let id, foodName: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "food_id"
        case foodName = "food_name"
    }
}

// MARK: - Note
struct Note: Codable, Identifiable {
    let id, note, startTime, startDate: String?
    let endDate, endTime, notesCateg, createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "note_id"
        case note
        case startTime = "start_time"
        case startDate = "start_date"
        case endDate = "end_date"
        case endTime = "end_time"
        case notesCateg = "notes_categ"
        case createdAt = "created_at"
    }
}

// MARK: - Offer
struct Offer: Codable, Identifiable {
    let id, name, productName, description: String?
    let offerImage: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "offer_id"
        case name
        case productName = "product_name"
        case description
        case offerImage = "offer_image"
    }
}

// MARK: - Profile
struct Profile: Codable {
    let hostelStudAppID, studentName: String?
    let studentImg: String?
    
    enum CodingKeys: String, CodingKey {
        case hostelStudAppID = "hostel_stud_app_id"
        case studentName, studentImg
    }
}

// MARK: - Roomy
struct Roomy: Codable, Identifiable {
    let id, bookingStudentID, studentAppID, studntName: String?
    let studentImg: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "room_bed_id"
        case bookingStudentID = "booking_student_id"
        case studentAppID = "student_app_id"
        case studntName, studentImg
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
