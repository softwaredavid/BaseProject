//
//  ParseModel.swift
//  BaseProject
//
//  Created by jintelai on 2018/6/29.
//  Copyright © 2018年 jintelai. All rights reserved.
//
import RxSwift
import Moya


struct ResultModel<T: Codable>: Codable {
    var code: String?
    var msg: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case msg = "Msg"
        case data = "Data"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy:CodingKeys.self)
        code = try? container.decode(String.self, forKey: .code)
        msg = try? container.decode(String.self, forKey: .msg)
        data = try? container.decode(T.self, forKey: .data)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(code, forKey: .code)
        try? container.encode(msg, forKey: .msg)
        try? container.encode(data, forKey: .data)
    }
}

struct FileData {
    var fileData: Data! // 文件数据
    var fileName: String! // 文件名字
    var mimeType: String! // 文件类型
    var serviceName: String! // 文件服务器名字
}
