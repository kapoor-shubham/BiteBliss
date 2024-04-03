//
//  CategoryListCollectionViewCell.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 28/03/24.
//

import UIKit

class CategoryListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    
    var category: CategoriesResponseModel.Category? {
        didSet {
            categoryLabel.text = category?.strCategory
            categoryImageView.imageFromServerURL(category?.strCategoryThumb ?? "", placeHolder: nil)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        categoryImageView.image = nil
        categoryLabel.text = nil
    }
}
