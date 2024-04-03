//
//  HTTPMethod.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 28/03/24.
//  Copyright © 2019 Shubham Kapoor. All rights reserved.
//

import Foundation

typealias HTTPHeaders = [String:String]

enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
}

