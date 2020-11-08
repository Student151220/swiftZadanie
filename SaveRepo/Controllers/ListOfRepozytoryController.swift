//
//  ListOfRepozytoryController.swift
//  SaveRepo
//
//  Created by Damian Prokop on 07/11/2020.
//  Copyright © 2020 Damian Prokop. All rights reserved.
//

import UIKit

class ListOfRepozytoryController: UITableViewController {
    
    
    var downloadData: GitHubData?
    var selectIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: K.Cell.CellRepozytoryNibName, bundle: nil), forCellReuseIdentifier: K.Cell.CellRepozytoryIdentifier)
        tableView.rowHeight = 50.0
        //tableView.allowsSelection = false
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return downloadData?.items.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let item = downloadData?.items[indexPath.row] {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.CellRepozytoryIdentifier, for: indexPath) as! CellRepozytory
            cell.titleLabel.text = item.name
            cell.starLabel.text = String(item.stargazers_count)
            return cell
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.CellSimple, for: indexPath)
            cell.textLabel?.text = "Brak wyników"
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectIndex = indexPath.row
        performSegue(withIdentifier: K.Segue.goToDetailsRepozytory, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segue.goToDetailsRepozytory {
            let destinationVC = segue.destination as! DetailsRepozytory
            destinationVC.item = downloadData?.items[selectIndex]
        }
    }
    
    
}
