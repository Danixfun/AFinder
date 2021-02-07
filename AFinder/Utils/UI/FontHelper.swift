//
//  FontHelper.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//

import UIKit

class FontHelper {
    
    //MARK:  Init
    static let shared = FontHelper()
    private init(){
        globalButtonTextSize = 16.0
    }
    
    //MARK:  Global constants
    let globalFontName = "Helvetica"
    let globalButtonTextSize: CGFloat
    
    //MARK:  Global fonts
    var primaryButton: UIFont {
        return UIFont(name: globalFontName, size: globalButtonTextSize)!
    }
    
}
