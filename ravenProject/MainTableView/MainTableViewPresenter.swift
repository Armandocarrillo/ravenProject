//
//  MainTableViewPresenters.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import Foundation

class MainTableViewPresenter {
    public var interactor :  MainTableViewInteractorProtocol?
    public var router :  MainTableViewWireframeProtocol?
    public weak var view :  MainTableViewViewProtocol?
    
}

extension MainTableViewPresenter : MainTableViewPresenterProtocol{
    func startLoader() {
        
    }
    
    func stopLoader() {
        
    }
    
   
    
}
