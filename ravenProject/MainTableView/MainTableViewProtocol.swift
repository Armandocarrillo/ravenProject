//
//  MainTableViewProtocol.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import Foundation
import UIKit

//MARK: Wireframe -
protocol MainTableViewWireframeProtocol: AnyObject {
    func goToWebView(url : String)
   
  
}
//MARK: Presenter -
protocol MainTableViewPresenterProtocol: AnyObject {
    
    func getNews()
    func successGetNew(_ model : GetNewsResponse?)
    func errorGetNews()
    func goToWebView(url : String)
}

//MARK: Interactor -
protocol MainTableViewInteractorProtocol: AnyObject {
    func getNews()
 
}

//MARK: View -
protocol MainTableViewViewProtocol: AnyObject {

    func successGetNew(_ model : GetNewsResponse?)
    func errorGetNews()
    
   
}

protocol MainTableViewContainerDelegate: AnyObject{
    func pullRefresh()
    func goToDetail(item: Hit?)
}
