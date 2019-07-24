//
//  ViewController.swift
//  NoStory
//
//  Created by Andrey Yastrebov on 13/07/2019.
//  Copyright © 2019 Andrey Yastrebov. All rights reserved.
//

import UIKit

@IBDesignable

class DummyViewController: UIViewController {
    var data: [String: String]?
}

class PepeViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
}

extension PepeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell_reuse_id", for: indexPath)
    }
}

class ViewController: UIViewController {

    @IBAction func storyboardButtonPressed(_ sender: Any) {
        
        let start = CFAbsoluteTimeGetCurrent()
        let storyboard = UIStoryboard(name: "StoryboardViewController", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateInitialViewController() else {return}
        viewController.loadViewIfNeeded()
        let diff = CFAbsoluteTimeGetCurrent() - start
        print("Storyboard load took: \(diff) seconds")
        
        navigationController?.show(viewController, sender: nil)
    }
    
    @IBAction func codeButtonPressed(_ sender: Any) {
        
        let start = CFAbsoluteTimeGetCurrent()
        let viewController = CodeViewController(nibName: nil, bundle: nil)
        viewController.loadViewIfNeeded()
        let diff = CFAbsoluteTimeGetCurrent() - start
        print("Code load took \(diff) seconds")
        
        navigationController?.show(viewController, sender: nil)
    }
    
    @IBAction func segueButtonPressed(_ sender: Any) {
        moveToDummyViewController()
    }
    
    func moveToDummyViewController() {
        let data = ["Just": "Dummy data"]
        
        performSegue(withIdentifier: "dummy_segue", sender: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "dummy_segue" {
            let destinationVC = segue.destination as! DummyViewController
            destinationVC.data = sender as? [String: String]
        }
    }
}

