//
//  NetworkResult.swift
//  SOPT_28th_iOS_Assignment
//
//  Created by 장서현 on 2021/05/14.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
