//
//  MealsListViewController.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 03/04/24.
//

import UIKit

class MealsListViewController: UIViewController {
    
    @IBOutlet private weak var mealsTableView: UITableView!
    @IBOutlet private weak var headerLabel: UILabel!
    
    var dataSource = MealsListDataSource()
    var mealType = String()
    var meals = [Meals]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initCollectionDataSource()
    }
    
    func setupView() {
        headerLabel.text = "\(mealType) Meals"
    }
    
    func initCollectionDataSource() {
        self.mealsTableView.delegate = self.dataSource
        self.mealsTableView.dataSource = self.dataSource
        self.dataSource.registerCells(forTableView: self.mealsTableView)
        self.dataSource.mealsList = self.meals
        self.mealsTableView.reloadData()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
