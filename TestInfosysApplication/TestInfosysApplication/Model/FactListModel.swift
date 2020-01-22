//
//  InfoItems.swift
//  TestInfosysApplication
//
//  Created by Anshika on 21/01/20.
//  Copyright © 2020 Anshika. All rights reserved.
//

import Foundation

struct FactListModel: Codable {
    let title: String?
    var rows: [FactModel]?
    
    init(title: String, rows: [FactModel] = []) {
        self.title = title
        self.rows = rows
    }
}
