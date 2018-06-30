//
//  TestModel.swift
//  BaseProject
//
//  Created by jintelai on 2018/6/30.
//  Copyright © 2018年 jintelai. All rights reserved.
//
import Foundation

struct TestModel: Codable {
    var name: String?
    var age: Int?
}

struct TestModelServerDif: Codable {
    var name: String?
    var age: Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "user_name"
        case age = "user_age"
    }
}

struct TestModelDate {
    var name: String?
    var age: Int?
    var birthday: Date?
    var imgUrl: URL? // 可以直接转换
    
    enum CodingKeys: String, CodingKey {
        case name = "user_name"
        case age = "user_age"
        case birthday
    }
    
   /* func test() { // 特殊字段的处理
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.dataDecodingStrategy = .base64
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: <#T##String#>, negativeInfinity: <#T##String#>, nan: <#T##String#>)
        
        
        let encode = JSONEncoder()
        encode.dateEncodingStrategy = .custom({ (date, encoder) in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
            let stringData = formatter.string(from: date)
            var container = encoder.singleValueContainer()
            
            try container.encode(stringData)
        })
    }*/
}

struct TestModelCustom {
    var code: String?
    var msg: String?
    var date: Date?
    
    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case msg = "Msg"
        case data = "Data"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy:CodingKeys.self)
        code = try? container.decode(String.self, forKey: .code)
        msg = try? container.decode(String.self, forKey: .msg)
        date = try? container.decode(Date.self, forKey: .data)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(code, forKey: .code)
        try? container.encode(msg, forKey: .msg)
        try? container.encode(date, forKey: .data)
    }
}
