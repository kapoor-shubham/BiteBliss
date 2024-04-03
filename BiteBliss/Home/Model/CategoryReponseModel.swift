//
//  CategoryReponseModel.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 28/03/24.
//

import Foundation

// MARK: - CategoriesResponseModel
struct CategoriesResponseModel: Decodable {
    let categories: [Category]
    
    // MARK: - Category
    struct Category: Decodable {
        let idCategory, strCategory: String?
        let strCategoryThumb: String?
        let strCategoryDescription: String?
    }
}
