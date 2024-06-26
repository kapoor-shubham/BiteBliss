//
//  MealsListDataSource.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 03/04/24.
//

import UIKit

protocol MealDetailDelegate {
    func sendMealDetail(meal: Meals)
}

class MealsListDataSource: NSObject {
    
    var mealsList = [Meals]()
    var delegate: MealDetailDelegate?
    
    /// Register Table Cell
    func registerCells(forTableView tableView: UITableView) {
        tableView.register(UINib(nibName: CellIdentifiers.mealsListTableViewCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.mealsListTableViewCell)
    }

    /// Load Cell in UITableView
    private func loadCell(atIndexPath indexPath: IndexPath, forTableView tableView: UITableView) -> UITableViewCell {

        let cellIdentifier = CellIdentifiers.mealsListTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealsListTableViewCell else {
            return UITableViewCell()
        }

        cell.setUpCell(meal: mealsList[indexPath.row])
        return cell
    }
}

//MARK:- UITableViewDataSource
extension MealsListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.loadCell(atIndexPath: indexPath, forTableView: tableView)
    }
}

//MARK:- UITableViewDelegate
extension MealsListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.sendMealDetail(meal: mealsList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

