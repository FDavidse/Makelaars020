//
//  Makelaar.swift
//  Makelaars020
//
//  Created by Filip Davidse on 04-05-19.
//  Copyright © 2019 Filip Davidse. All rights reserved.
//

import Foundation

struct Makelaar: Equatable {
    
    static func == (lhs: Makelaar, rhs: Makelaar) -> Bool {
        
        let setl = Set.init(lhs.housesUnderSale)
        let setr = Set.init(rhs.housesUnderSale)

        return lhs.makelaarId == rhs.makelaarId
        && lhs.name == rhs.name &&
        setl == setr
        
    }
 
    let name: String
    let makelaarId: Int
    var housesUnderSale:[String] = []
    
}

extension Sequence where Iterator.Element == Makelaar {
    
    /// Updates an array with makelaars by adding the new [elements]
    /// If those makelaars are already present, then the property housesUnderSale of the relevant makelaars are updated by adding the identifiers from the housesUnderSale property to them.
    /// This means there are no double entries for the same makelaar in the array
    /// - Parameters:
    ///    - makelaar: of type [Makelaar], used to update the array
    /// - Returns: an updated array of Makelaar
    func updateMakelaarListsWith(makelaars: [Makelaar]) -> [Makelaar] {
        
        var newArray:[Makelaar] = []
        self.forEach { (item) in
            newArray.append(item)
        }
        makelaars.forEach { (makelaar) in
            var m = makelaar

            if let index = newArray.firstIndex(where: { (item) -> Bool in
                return item.makelaarId == m.makelaarId
            }) {
                let ids = m.housesUnderSale + newArray[index].housesUnderSale
                //ids.filter
                m.housesUnderSale = ids
                newArray[index] = m
            } else {
                newArray.append(m)
            }
        }
        
        return newArray
    }
    
    func getTopTen() -> [Makelaar] {
        
        var sortedList: [Makelaar] = self.sorted { (m1, m2) -> Bool in
            return m1.housesUnderSale.count > m2.housesUnderSale.count
        }
        
        var truncacted: [Makelaar] = []
        for i in 0..<10 {
            truncacted.append(sortedList[i])
        }
        
        return truncacted
    }
}
