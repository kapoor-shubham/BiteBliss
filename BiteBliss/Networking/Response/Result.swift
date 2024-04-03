//
//  Result.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 28/03/24.
//  Copyright © 2019 Shubham Kapoor. All rights reserved.
//

import Foundation
enum Result<T, U> where U: Error{
    case success(T)
    case failure(U)
}
