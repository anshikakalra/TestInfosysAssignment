//
//  SingleLabelTableViewCell.swift
//  MovieDB
//
//  Created by Anshika on 31/03/21.
//  Copyright © 2021 Anshika. All rights reserved.
//

import UIKit

class SingleLabelTableViewCell: UITableViewCell {
    
    //MARK: subviews
    let titleLabel = UILabel()
    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        //configure titleLabel
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI setup method
    func setupCellData(title: String) {
        self.titleLabel.text = title
    }
    
    //to ensure image duplicay does not happen
    override func prepareForReuse() {
        self.titleLabel.text = ""
    }


}
