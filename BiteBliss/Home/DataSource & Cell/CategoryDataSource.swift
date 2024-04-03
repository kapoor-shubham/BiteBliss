//
//  CategoryDataSource.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 28/03/24.
//

import UIKit

class CategoryDataSource: NSObject {
    
    var categories = [CategoriesResponseModel.Category]()
    
    func registerCells(forCollectionView collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: CellIdentifiers.categoryListCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.categoryListCollectionViewCell)
    }

    private func loadCell(atIndexPath indexPath: IndexPath, forCollectionView collectionView: UICollectionView) -> UICollectionViewCell {

        let cellIdentifier = CellIdentifiers.categoryListCollectionViewCell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CategoryListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.category = categories[indexPath.row]
        return cell
    }
}

extension CategoryDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.loadCell(atIndexPath: indexPath, forCollectionView: collectionView)
    }
}

extension CategoryDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}

extension CategoryDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
