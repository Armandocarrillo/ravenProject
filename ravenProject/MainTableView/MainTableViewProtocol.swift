//
//  MainTableViewProtocol.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import Foundation

//MARK: Wireframe -
protocol MainTableViewWireframeProtocol: AnyObject {
  
}
//MARK: Presenter -
protocol MainTableViewPresenterProtocol: AnyObject {
    func startLoader()
    func stopLoader()

}

//MARK: Interactor -
protocol MainTableViewInteractorProtocol: AnyObject {

 
}

//MARK: View -
protocol MainTableViewViewProtocol: AnyObject {

    
    func presentLoader()
    func removeLoader()
    
   
}

protocol MainTableViewContainerDelegate: AnyObject{
    
}
