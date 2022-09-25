//
//  MainTableViewContainer.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import UIKit



internal class MainTableViewContainer : UIView{
    weak var delegate: MainTableViewContainerDelegate?
    
    
    public convenience init(
        delegate: MainTableViewContainerDelegate){
        self.init()
        self.delegate = delegate
        setupUIElements()
        setupConstraints()
        
            self.backgroundColor = UIColor.blue
        
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

        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
           
        ])
    }
    
}



