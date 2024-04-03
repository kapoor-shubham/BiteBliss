//
//  MealsListTableViewCell.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 03/04/24.
//

import UIKit

class MealsListTableViewCell: UITableViewCell {

//MARK: @IBOutlets
    @IBOutlet private weak var mealImageView: UIImageView!
    @IBOutlet private weak var mealNameLabel: UILabel!
    @IBOutlet private weak var mealCategoryLabel: UILabel!
    @IBOutlet private weak var mealLinkLTextView: UITextView!
    
    /// Setup Cell
    func setUpCell(meal: Meals) {
        mealImageView.imageFromServerURL(meal.strMealThumb ?? "", placeHolder: nil)
        mealNameLabel.text = meal.strMeal
        mealCategoryLabel.text = meal.strCategory
        if let mealSource = meal.strSource {
            let attributedString = NSMutableAttributedString(string: mealSource)
            attributedString.addAttribute(.link, value: mealSource, range: NSRange(location: 0, length: mealSource.count))
            mealLinkLTextView.attributedText = attributedString
        }
    }
}

//MARK:- UITextViewDelegate
extension MealsListTableViewCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}
