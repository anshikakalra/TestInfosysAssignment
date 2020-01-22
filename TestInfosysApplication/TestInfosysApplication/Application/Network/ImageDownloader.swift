//
//  ImageDownloader.swift
//  TestInfosysApplication
//
//  Created by Anshika on 21/01/20.
//  Copyright © 2020 Anshika. All rights reserved.
//

import UIKit

class ImageDownloader: Operation {
    //1
    let photoRecord: PhotoRecord
    
    //2
    init(_ photoRecord: PhotoRecord) {
        self.photoRecord = photoRecord
    }
    
    //3
    override func main() {
        //4
        if isCancelled {
            return
        }
        
        //5
        guard let imageData = try? Data(contentsOf: photoRecord.url) else { return }
        
        //6
        if isCancelled {
            return
        }
        
        //7
        if !imageData.isEmpty {
            photoRecord.image = UIImage(data:imageData)
            photoRecord.state = .downloaded
        } else {
            photoRecord.state = .failed
            photoRecord.image = UIImage(named: "Failed")
        }
    }
}
