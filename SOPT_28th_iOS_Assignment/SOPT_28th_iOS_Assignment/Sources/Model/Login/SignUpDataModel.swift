//
//  SignUpDataModel.swift
//  SOPT_28th_iOS_Assignment
//
//  Created by 장서현 on 2021/05/14.
//

import Foundation
// MARK: - Welcome
struct SignUpDataModel: Codable {
    let success: Bool
    let message: String
    let data: newData?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
    }
    
    init(from decoder : Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(newData.self, forKey: .data)) ?? nil
    }
}

// MARK: - DataClass
struct newData: Codable {
    let nickname: String
}
