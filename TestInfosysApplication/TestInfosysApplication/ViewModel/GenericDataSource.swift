//
//  GenericDataSource.swift
//  TestInfosysApplication
//
//  Created by Anshika on 22/01/20.
//  Copyright © 2020 Anshika. All rights reserved.
//

import Foundation

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
