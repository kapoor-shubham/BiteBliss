//
//  MealsListViewController.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 03/04/24.
//

import UIKit

class MealsListViewController: UIViewController {
    
    //    MARK: @IBOutlets & Variables
    @IBOutlet private weak var mealsTableView: UITableView!
    @IBOutlet private weak var headerLabel: UILabel!
    
    var dataSource = MealsListDataSource()
    var mealType = String()
    var meals = [Meals]()

    //    MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initCollectionDataSource()
    }
    
    //    MARK: @IBActions
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    MARK: Helper Methods
    
    /// Setup Initial View
    func setupView() {
        headerLabel.text = "\(mealType) Meals"
    }
    
    /// Initialising Datasource for table view and setting up reverse delegate
    func initCollectionDataSource() {
        self.mealsTableView.delegate = self.dataSource
        self.mealsTableView.dataSource = self.dataSource
        self.dataSource.registerCells(forTableView: self.mealsTableView)
        self.dataSource.mealsList = self.meals
        self.dataSource.delegate = self
        self.mealsTableView.reloadData()
    }
}

//MARK:- MealDetailDelegate
extension MealsListViewController: MealDetailDelegate {
    
    /// Navigate to Meal Detail Page
    func sendMealDetail(meal: Meals) {
        if let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: ControllerIdentifiers.mealDetailViewController) as? MealDetailViewController {
            vc.mealDetail = meal
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
