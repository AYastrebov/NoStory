//
//  StoryboardViewController.swift
//  NoStory
//
//  Created by Andrey Yastrebov on 13/07/2019.
//  Copyright © 2019 Andrey Yastrebov. All rights reserved.
//

import UIKit

class StoryboardViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var stacView: UIStackView!
    
    @IBAction private func likeButtonPressed(_ sender: Any) {
        print("Like")
    }
    
    @IBAction private func shareButtonPressed(_ sender: Any) {
        print("Share")
    }
}
