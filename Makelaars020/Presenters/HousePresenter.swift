//
//  HousePresenter.swift
//  Makelaars020
//
//  Created by Filip Davidse on 04-05-19.
//  Copyright © 2019 Filip Davidse. All rights reserved.
//

import Foundation

protocol HousePresenterInterface {
    
}

class HousePresenter: HousePresenterInterface {
    
    let manager: HousesManagerInterface
    
    init(manager: HousesManagerInterface) {
        
        self.manager = manager
        
    }
    
}
