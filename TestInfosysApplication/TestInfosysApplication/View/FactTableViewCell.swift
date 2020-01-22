//
//  FactTableViewCell.swift
//  TestInfosysApplication
//
//  Created by Anshika on 21/01/20.
//  Copyright © 2020 Anshika. All rights reserved.
//

import UIKit

class FactTableViewCell: UITableViewCell {
    //MARK: subviews
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let imageHrefImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 21.5
        img.clipsToBounds = true
        img.backgroundColor = UIColor.gray
        return img
    }()

    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        //configure photoImage
        contentView.addSubview(imageHrefImageView)
        imageHrefImageView.leadingAnchor.constraint(equalTo:marginGuide.leadingAnchor).isActive = true
        imageHrefImageView.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        imageHrefImageView.widthAnchor.constraint(equalToConstant: 45.0).isActive = true
        imageHrefImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        // configure title
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: imageHrefImageView.trailingAnchor, constant: 8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        
        // configure description
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: imageHrefImageView.trailingAnchor, constant: 8).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "Avenir-Book", size: 12)
        descriptionLabel.textColor = UIColor.lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

