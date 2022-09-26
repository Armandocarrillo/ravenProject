//
//  MainCell.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import UIKit

internal class MainCell: UITableViewCell {

    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var stackVies : UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 0
        stack.axis = .vertical
        stack.alignment = .trailing
        return stack
    }()
    
    lazy var titleDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.text = ""
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    lazy var autorDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.lightGray
        label.text = ""
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = UIColor.white
        setupUIElements()
        setupConstraints()
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
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            
            titleDescription.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            titleDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            titleDescription.heightAnchor.constraint(equalToConstant: 50),
            
            autorDescription.topAnchor.constraint(equalTo: titleDescription.bottomAnchor, constant: 4),
            autorDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            autorDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            autorDescription.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}

