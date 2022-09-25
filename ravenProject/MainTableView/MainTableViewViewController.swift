//
//  MainTableViewViewControllers.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import UIKit

class MainTableViewViewController : UIViewController {
    public var presenter : MainTableViewPresenterProtocol?
    private var ui : MainTableViewContainer?
    
    
    override func loadView() {
        ui = MainTableViewContainer(delegate: self)
        view = ui
        
    }
    
    override func viewDidLoad() {
        
    }
    
    
    
}

extension MainTableViewViewController : MainTableViewViewProtocol{
    func presentLoader() {
        
    }
    
    func removeLoader() {
        
    }
    
  
    
}

extension MainTableViewViewController : MainTableViewContainerDelegate {
    
}
