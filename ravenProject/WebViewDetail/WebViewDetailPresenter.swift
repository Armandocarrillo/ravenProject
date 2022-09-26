//
//  WebViewDetailPresenter.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 26/09/22.
//

import Foundation

class WebViewDetailPresenters {
    public var interactor :  WebViewDetailInteractorProtocols?
    public var router :  WebViewDetailWireframeProtocols?
    public weak var view :  WebViewDetailViewProtocols?
    
}

extension WebViewDetailPresenters : WebViewDetailPresenterProtocols{
   
    
}

