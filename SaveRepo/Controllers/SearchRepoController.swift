//
//  SearchRepoController.swift
//  SaveRepo
//
//  Created by Damian Prokop on 04/11/2020.
//  Copyright © 2020 Damian Prokop. All rights reserved.
//

import UIKit

class SearchRepoController: UIViewController {
    
    @IBOutlet weak var searchTitleTextField: UITextField!
    @IBOutlet weak var languageTextField: UITextField!
    var gitHubManager = GitHubManager()
    var downloadData: GitHubData?
    
    
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        searchButton.layer.cornerRadius = 15.0
        searchTitleTextField.delegate = self
        languageTextField.delegate = self
        gitHubManager.delegate = self
    }
    //tetris+language:assembly
    
    @IBAction func searchPress(_ sender: UIButton) {
        if searchTitleTextField.text != "" , languageTextField.text != ""{
            gitHubManager.request(title: searchTitleTextField.text!, language: languageTextField.text!)
        }else{
            runAlert()
        }
    }
    func runAlert() {
        let alert = UIAlertController(title: "Uzupełnij poprawnie wszystkie pola!", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            return
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segue.goDoListOfRepozytoryController {
            let destinationVC = segue.destination as! ListOfRepozytoryController
            destinationVC.downloadData = downloadData
        }
    }

}

// MARK: - UITextFieldDelegate methods
extension SearchRepoController: UITextFieldDelegate{
   
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTitleTextField.endEditing(true)
        languageTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTitleTextField.endEditing(true)
        languageTextField.endEditing(true)
        return true
    }
}


// MARK: - GitHubManagerMethod methods
extension SearchRepoController: GitHubManagerDelegate{
    func didUpdaterRepozytory(_ gitHubManager: GitHubManager, repozytory: GitHubData) {
        DispatchQueue.main.async {
            self.downloadData = repozytory
            self.performSegue(withIdentifier: K.Segue.goDoListOfRepozytoryController, sender: self)
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
        DispatchQueue.main.async {
            self.runAlert()
        }
    }
    
    
    
}
