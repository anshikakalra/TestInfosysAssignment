//
//  SingleImageTableViewCell.swift
//  MovieDB
//
//  Created by Anshika on 31/03/21.
//  Copyright © 2021 Anshika. All rights reserved.
//

import UIKit

class SingleImageTableViewCell: UITableViewCell {

    //MARK: subviews
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
        imageHrefImageView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI setup method
    func setupCellData(image: String?) {
        self.selectionStyle = .none
        self.imageHrefImageView.sd_setImage(with: URL(string: image ?? ""), placeholderImage: nil, options: [.retryFailed], context: nil)
    }
    
    //to ensure image duplicay does not happen
    override func prepareForReuse() {
        self.imageHrefImageView.image = nil
    }
}

