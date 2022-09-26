//
//  MainTableViewPresenters.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import UIKit

class MainTableViewPresenter {
    public var interactor :  MainTableViewInteractorProtocol?
    public var router :  MainTableViewWireframeProtocol?
    public weak var view :  MainTableViewViewProtocol?
    
}

extension MainTableViewPresenter : MainTableViewPresenterProtocol{
    func goToWebView(url: String) {
        router?.goToWebView(url: url)
    }
    
    func errorGetNews() {
        view?.errorGetNews()
    }
    
    func successGetNew(_ model: GetNewsResponse?) {
        view?.successGetNew(model)
    }
    
    func getNews() {
        if Reachability.isConnectedToNetwork(){
            interactor?.getNews()
        }else{
            view?.errorGetNews()
        }
  
    }
  
   
    
}
