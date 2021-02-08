//
//  MapLocalDataManager.swift
//  AFinder
//
<<<<<<< HEAD
//  Created by Daniel Tejeda on 05/02/21.
=======
//  Created by Daniel Tejeda on 07/02/21.
>>>>>>> develop
//  
//

import Foundation

class MapLocalDataManager:MapLocalDataManagerInputProtocol {
    
    var localRequestHandler: MapLocalDataManagerOutputProtocol?
    
<<<<<<< HEAD
=======
    func getRange() -> Int {
        if let range = UserDefaults.standard.value(forKey: UserPreferences.RangeKey) as? Int{
            return range
        }
        return RadiusRangeValues.defaultValue//Default value to prevent errors
    }
>>>>>>> develop
}
