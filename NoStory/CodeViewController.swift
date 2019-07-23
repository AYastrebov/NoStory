//
//  CodeViewController.swift
//  NoStory
//
//  Created by Andrey Yastrebov on 13/07/2019.
//  Copyright © 2019 Andrey Yastrebov. All rights reserved.
//

import UIKit
import SnapKit

class CodeViewController: UIViewController {
    
    private lazy var imageView = UIImageView(image: UIImage(named: "023"))
    private lazy var titleLabel = UILabel()
    private lazy var stackView = UIStackView(arrangedSubviews: [likeButton, shareButton])
    private lazy var likeButton = UIButton(type: .system)
    private lazy var shareButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        
        likeButton.setTitle("Like", for: .normal)
        likeButton.addTarget(self, action: #selector(likeButtonPressed(_:)), for: .touchUpInside)
        
        shareButton.setTitle("Share", for: .normal)
        shareButton.addTarget(self, action: #selector(shareButtonPressed(_:)), for: .touchUpInside)
        
        titleLabel.numberOfLines = 0
        titleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        setupLayoutWithAnchors()
//        setupLayoutWithConstraints()
//        setupLayoutWithAVFL()
//        setupLayoutWithAutoresizeMasks()
    }
    
    @objc private func likeButtonPressed(_ sender: Any) {
        print("Like")
    }
    
    @objc private func shareButtonPressed(_ sender: Any) {
        print("Share")
    }
    
    private func setupLayoutWithAnchors() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            imageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: -12),
            imageView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 12),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -12),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 12),
            stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -12),
            ])
    }
    
    private func setupLayoutWithAVFL() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let metrics = ["imageHeght": view.frame.width - 12 - 12]
        
        let views: [String: Any] = [
            "imageView": imageView,
            "titleLabel": titleLabel,
            "stackView": stackView]
        
        var allConstraints: [NSLayoutConstraint] = []
        
        let imageViewVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-12-[imageView(imageHeght)]",
            metrics: metrics,
            views: views)
        allConstraints += imageViewVerticalConstraints
        
        let imageViewHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-12-[imageView]-12-|",
            metrics: nil,
            views: views)
        allConstraints += imageViewHorizontalConstraints
        
        //TODO: Implement for titleLabel and stackView
        
        NSLayoutConstraint.activate(allConstraints)
    }
    
    private func setupLayoutWithSnapkit() {
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            make.left.equalTo(view.snp.left).offset(12)
            make.right.equalTo(view.snp.right).offset(-12)
            make.width.equalTo(imageView.snp.height)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(12)
            make.left.equalTo(view.snp.left).offset(12)
            make.right.equalTo(view.snp.right).offset(-12)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.left.equalTo(view.snp.left).offset(12)
            make.right.equalTo(view.snp.right).offset(-12)
        }
    }
    
    private func setupLayoutWithConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageLeftToViewConstraint =
        NSLayoutConstraint(item: imageView,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .left,
                           multiplier: 1,
                           constant: 12)
        
        let imageRightToViewConstraint =
            NSLayoutConstraint(item: imageView,
                               attribute: .right,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .right,
                               multiplier: 1,
                               constant: -12)
        
        let imageTopToViewConstraint =
            NSLayoutConstraint(item: imageView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: view.safeAreaLayoutGuide,
                               attribute: .top,
                               multiplier: 1,
                               constant: 12)
        
        let imageRationConstraint =
            NSLayoutConstraint(item: imageView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: imageView,
                               attribute: .width,
                               multiplier: 1,
                               constant: 0)
        
        NSLayoutConstraint.activate([imageRationConstraint, imageTopToViewConstraint, imageLeftToViewConstraint, imageRightToViewConstraint])
    }
    
    private func setupLayoutWithAutoresizeMasks() {
        
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.frame = CGRect(x: CGFloat(12),
                                 y: CGFloat(12),
                                 width: view.bounds.width - CGFloat(12) - CGFloat(12),
                                 height: view.bounds.width - CGFloat(12) - CGFloat(12))
        
        titleLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        titleLabel.frame = CGRect(x: CGFloat(12),
                                  y: imageView.frame.maxY + CGFloat(12),
                                  width: view.bounds.width - CGFloat(12) - CGFloat(12),
                                  height: 100)
        
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        stackView.frame = CGRect(x: CGFloat(12),
                                 y: titleLabel.frame.maxY + CGFloat(12),
                                 width: view.bounds.width - CGFloat(12) - CGFloat(12),
                                 height: 24)
    }
}
