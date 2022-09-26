//
//  WebViewDetailViewController.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 26/09/22.
//

import Foundation
import UIKit

class WebViewDetailViewControllers : UIViewController {
    public var presenter : WebViewDetailPresenterProtocols?
    private var ui : WebViewDetailContainer?
    var url : String?
    
    
    override func loadView() {
        ui = WebViewDetailContainer(delegate: self)
        view = ui
    }
    
    override func viewDidLoad() {
        
        if let url = url {
            let myURL = URL(string: url)
            let myRequest = URLRequest(url: myURL!)
            ui?.webView.load(myRequest)
        }
        
    }
    
    
}

extension WebViewDetailViewControllers : WebViewDetailViewProtocols{
   
    
}


extension WebViewDetailViewControllers : WebViewDetailContainerDelegate {
    
}


