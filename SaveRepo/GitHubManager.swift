//
//  GitHubManager.swift
//  SaveRepo
//
//  Created by Damian Prokop on 05/11/2020.
//  Copyright © 2020 Damian Prokop. All rights reserved.
//

import Foundation
protocol GitHubManagerDelegate {
    func didUpdaterRepozytory(_ gitHubManager: GitHubManager, repozytory: GitHubData)
    func didFailWithError(error:Error)
}



struct GitHubManager {
    let beginUrlString = "https://api.github.com/search/repositories?q="
    let endUrlString = "&sort=stars&order=desc"
    var delegate: GitHubManagerDelegate?
    
    func request(title:String, language: String){
        let urlString = "\(beginUrlString)\(title)+language:\(language)\(endUrlString)"
        
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let gitHubData = self.parseJSON(safeData){
                        self.delegate?.didUpdaterRepozytory(self, repozytory: gitHubData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ gitHubData: Data) -> GitHubData?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(GitHubData.self, from: gitHubData)
            return decodedData
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
