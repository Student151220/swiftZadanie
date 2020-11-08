//
//  ViewController.swift
//  SaveRepo
//
//  Created by Damian Prokop on 04/11/2020.
//  Copyright © 2020 Damian Prokop. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {
    

    @IBOutlet weak var searchRepoButton: UIButton!
    @IBOutlet weak var browseButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        searchRepoButton.layer.cornerRadius = 15.0
        browseButton.layer.cornerRadius = 15.0
        exitButton.layer.cornerRadius = 15.0    
    }
    
    
    
    @IBAction func PressSearchRepo(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.Segue.goToSearchRepoController, sender: nil)
    }
    
    


}

