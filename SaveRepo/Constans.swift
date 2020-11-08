//
//  Constans.swift
//  SaveRepo
//
//  Created by Damian Prokop on 04/11/2020.
//  Copyright © 2020 Damian Prokop. All rights reserved.
//

import Foundation


struct K {
    struct Controllers {
        static let SearchRepoController = "SearchRepoController"
        static let ListOfRepozytoryController = "ListOfRepozytoryController"
        static let DetailsRepozytory = "DetailsRepozytory"
    }
    struct Segue {
        static let goToSearchRepoController = "goToSearchRepoController"
        static let goDoListOfRepozytoryController = "goDoListOfRepozytoryController"
        static let goToDetailsRepozytory = "goToDetailsRepozytory"
    }
    struct Cell{
        static let CellRepozytoryNibName = "CellRepozytory"
        static let CellRepozytoryIdentifier = "CellRepozytoryIdentifier"
        static let CellSimple = "CellSimple"
    }
}
