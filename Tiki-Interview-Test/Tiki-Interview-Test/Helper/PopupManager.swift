//
//  PopupManager.swift
//  Tiki-Interview-Test
//
//  Created by Nguyen Van Uy on 5/23/18.
//  Copyright © 2018 Uy Nguyen Van. All rights reserved.
//

import Foundation
import UIKit

class PopupManager {
    static func showPopup(title: String, message: String, completion: @escaping () -> Void, actionHandle: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            actionHandle()
        }))
        
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
    static func showPopup(title: String, message: String, completion: @escaping () -> Void, primaryActionHandle: @escaping () -> Void, secondaryActionHandle: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            primaryActionHandle()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            secondaryActionHandle()
        }))
        
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            viewController.present(alert, animated: true, completion: nil)
        }
        
    }
}


