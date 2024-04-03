//
//  HomeViewController.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 28/03/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var dataSource = CategoryDataSource()
    var homeViewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        initCollectionDataSource()
        configureViewModel()
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        if let searchText = searchTextField.text, !searchText.isEmpty, searchText != "" {
            homeViewModel?.getSearchResponse(text: searchText)
        }
    }
    
    private func configureViewModel() {
        homeViewModel = HomeViewModel()
        
        homeViewModel?.categoryAPIResponse = { [weak self] result, error in
            if let response = result {
                self?.dataSource.categories = response
                self?.categoryCollectionView.reloadData()
            } else {
                /// Show Error
            }
        }
        
        homeViewModel?.getCategories()
    }
    
    func initCollectionDataSource() {
        self.categoryCollectionView.delegate = self.dataSource
        self.categoryCollectionView.dataSource = self.dataSource
        self.dataSource.registerCells(forCollectionView: self.categoryCollectionView)
    }
}
