//
//  MealDetailViewController.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 03/04/24.
//

import UIKit
import AVKit
import AVFoundation

class MealDetailViewController: UIViewController {

    @IBOutlet private weak var ytPlayerView: UIView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var mealNameLabel: UILabel!
    @IBOutlet private weak var instructionsTextView: UITextView!
    
    var player: AVPlayer!
    var mealDetail: Meals?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupView() {
        headerLabel.text = mealDetail?.strMeal
        instructionsTextView.text = mealDetail?.strInstructions
        loadYTVideo()
    }
    
    private func loadYTVideo() {
        if let urlStr = mealDetail?.strYoutube, let _ = URL(string: urlStr) {
            /// Show YT Video.
        }
    }
}
