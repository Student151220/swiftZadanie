//
//  GitHubData.swift
//  SaveRepo
//
//  Created by Damian Prokop on 05/11/2020.
//  Copyright © 2020 Damian Prokop. All rights reserved.
//

import Foundation


struct GitHubData: Codable {
    let items: [Items]
}

struct Items: Codable {
    let id: Int
    let name: String
    let owner: Owner
    let html_url: String
    let stargazers_count: Int
    let language: String
}
struct Owner:Codable {
    let login: String
}



