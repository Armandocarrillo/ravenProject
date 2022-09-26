//
//  navigation+Extension.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 26/09/22.
//

import Foundation
import UIKit

extension UINavigationController {
    
    public func initRootViewController(_ vc: UIViewController, duration: CFTimeInterval = 0.3) {
        self.viewControllers.removeAll()
        self.pushViewController(vc, animated: false)
        self.popToRootViewController(animated: false)
        
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().tintColor = .white
    }
}
