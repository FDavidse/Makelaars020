//
//  UIViewController+Utils.swift
//  Makelaars020
//
//  Created by Filip Davidse on 04-05-19.
//  Copyright © 2019 Filip Davidse. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showPopupWith(title: String?, message: String?) {
        
        DispatchQueue.main.async {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        
        }
    }
    
    
}
