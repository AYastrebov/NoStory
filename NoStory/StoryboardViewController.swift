//
//  StoryboardViewController.swift
//  NoStory
//
//  Created by Andrey Yastrebov on 13/07/2019.
//  Copyright © 2019 Andrey Yastrebov. All rights reserved.
//

import UIKit

class StoryboardViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var stacView: UIStackView!
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        print("Like")
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        print("Share")
    }
}
