//
//  WebViewDetailContainter.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 26/09/22.
//

import Foundation
import UIKit
import WebKit



internal class WebViewDetailContainer : UIView{
    weak var delegate: WebViewDetailContainerDelegate?
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    
    public convenience init(
        delegate: WebViewDetailContainerDelegate){
        self.init()
        self.delegate = delegate
        setupUIElements()
        setupConstraints()
            

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()

    }
    
    private func setupUIElements(){
        self.addSubview(webView)
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
           
            webView.topAnchor.constraint(equalTo: self.topAnchor),
            webView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
    
}

extension WebViewDetailContainer :  WKUIDelegate {
    
}
