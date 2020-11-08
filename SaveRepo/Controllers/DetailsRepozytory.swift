//
//  DetailsRepozytory.swift
//  SaveRepo
//
//  Created by Damian Prokop on 08/11/2020.
//  Copyright © 2020 Damian Prokop. All rights reserved.
//

import UIKit

class DetailsRepozytory: UIViewController {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var Language: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var openSafariButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    var item: Items?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openSafariButton.layer.cornerRadius = 15.0
        saveButton.layer.cornerRadius = 15.0
        NameLabel.text = "Nazwa: \(item?.name ?? "brak")"
        Language.text = "Język: \(item?.language ?? "brak")"
        authorLabel.text = "Autor: \(item?.owner.login ?? "brak")"
        if let stars = item?.stargazers_count {
            starLabel.text = String(stars)
        }
    }



    @IBAction func openSafariPress(_ sender: Any) {
        if let url = URL(string: (item?.html_url)!){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
