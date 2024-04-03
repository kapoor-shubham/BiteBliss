//
//  SearchResponseModel.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 03/04/24.
//

import Foundation

// MARK: - SearchResponseModel
struct SearchResponseModel: Codable {
    let meals: [Meals]
}

struct Meals: Codable {
    let idMeal, strMeal, strDrinkAlternate: String?
    let strCategory, strArea, strInstructions: String?
    let strMealThumb, strTags, strYoutube: String?
    let strIngredient1, strIngredient2, strIngredient3: String?
    let strIngredient4, strIngredient5, strIngredient6: String?
    let strIngredient7, strIngredient8, strIngredient9: String?
    let strIngredient10, strIngredient11, strIngredient12: String?
    let strIngredient13, strIngredient14, strIngredient15: String?
    let strIngredient16, strIngredient17, strIngredient18: String?
    let strIngredient19, strIngredient20, strMeasure1: String?
    let strMeasure2, strMeasure3, strMeasure4: String?
    let strMeasure5, strMeasure6, strMeasure7: String?
    let strMeasure8, strMeasure9, strMeasure10: String?
    let strMeasure11, strMeasure12, strMeasure13: String?
    let strMeasure14, strMeasur15, strMeasure16: String?
    let strMeasure17, strMeasure18, strMeasure19: String?
    let strMeasure20, strSource, strImageSource: String?
    let strCreativeCommonsConfirmed, dateModified: String?
}
