//
//  MainCellShimer.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import UIKit

internal class MainCellShimer: UITableViewCell {

    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var titleDescription: Raven_ShimmerView = {
        let label = Raven_ShimmerView(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(white: 0.85, alpha: 0.3)
        return label
    }()
    lazy var autorDescription: Raven_ShimmerView = {
        let label = Raven_ShimmerView(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(white: 0.85, alpha: 0.3)
        return label
    }()
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = UIColor.white
        setupUIElements()
        setupConstraints()
        titleDescription.startAnimating()
        autorDescription.startAnimating()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUIElements() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleDescription)
        containerView.addSubview(autorDescription)
       
    }
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            
       
            titleDescription.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            titleDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            titleDescription.heightAnchor.constraint(equalToConstant: 40),
            titleDescription.widthAnchor.constraint(equalToConstant: 100),
            
            autorDescription.topAnchor.constraint(equalTo: titleDescription.bottomAnchor),
            autorDescription.trailingAnchor.constraint(equalTo: titleDescription.trailingAnchor),
            autorDescription.leadingAnchor.constraint(equalTo: titleDescription.leadingAnchor),
            titleDescription.heightAnchor.constraint(equalToConstant: 40),
           
        ])
    }
    
}
