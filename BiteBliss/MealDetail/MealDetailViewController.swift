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
    
//    MARK: @IBOutlets & Variables
    @IBOutlet private weak var ytPlayerView: UIView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var mealNameLabel: UILabel!
    @IBOutlet private weak var instructionsTextView: UITextView!
    
    var player: AVPlayer!
    var mealDetail: Meals?
    
    //    MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
//    MARK: @@IBActions
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    MARK: Helper Methods
    
    /// setup Initial View
    private func setupView() {
        headerLabel.text = mealDetail?.strMeal
        mealNameLabel.text = mealDetail?.strMeal
        instructionsTextView.text = mealDetail?.strInstructions
        loadYTVideo()
    }
    
    /// Show Youtube Video
    private func loadYTVideo() {
        if let urlStr = mealDetail?.strYoutube, let _ = URL(string: urlStr) {
            //TODO: Integrate YT Player Pod to show YT Video, YT Video is not supporting within AV Player frames.
//            let player = AVPlayer(url: videoURL)
//            let playerLayer = AVPlayerLayer(player: player)
//            playerLayer.frame = self.ytPlayerView.bounds
//            self.ytPlayerView.layer.addSublayer(playerLayer)
//            player.play()
        }
    }
}
