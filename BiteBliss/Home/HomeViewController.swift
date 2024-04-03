//
//  HomeViewController.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 28/03/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var categoryCollectionView: UICollectionView!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var searchContainerView: UIView!
    
    var dataSource = CategoryDataSource()
    var homeViewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        initCollectionDataSource()
        configureViewModel()
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        if let searchText = searchTextField.text, !searchText.isEmpty, searchText != "" {
            homeViewModel?.getSearchResponse(searchText: searchText)
        }
    }
    
    private func configureViewModel() {
        homeViewModel = HomeViewModel()
        
        homeViewModel?.categoryAPIResponse = { [weak self] result, error in
            if let response = result {
                self?.dataSource.categories = response
                self?.categoryCollectionView.reloadData()
            } else {
                self?.showToast(message: error?.localizedDescription ?? "No Results Found")
            }
        }
        
        homeViewModel?.searchAPIResponse = { [weak self] result, error in
            if let response = result?.meals, let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: ControllerIdentifiers.mealsListViewController) as? MealsListViewController {
                vc.meals = response
                vc.mealType = self?.searchTextField.text ?? ""
                self?.navigationController?.pushViewController(vc, animated: true)
            } else {
                self?.showToast(message: error?.localizedDescription ?? "No Results Found")
            }
        }
        
        homeViewModel?.getCategories()
    }
    
    func initCollectionDataSource() {
        self.categoryCollectionView.delegate = self.dataSource
        self.categoryCollectionView.dataSource = self.dataSource
        self.dataSource.delegate = self
        self.dataSource.registerCells(forCollectionView: self.categoryCollectionView)
    }
    
    func setupView() {
        searchContainerView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        searchContainerView.layer.borderWidth = 1.0
        searchContainerView.layer.cornerRadius = 30
    }
}

extension HomeViewController: SearchCategoryMealDelegate {
    func searchMeal(meal: String) {
        homeViewModel?.getSearchResponse(searchText: meal)
    }
}
