//
//  InfoItemsManager.swift
//  TestInfosysApplication
//
//  Created by Anshika on 21/01/20.
//  Copyright © 2020 Anshika. All rights reserved.
//

import Foundation

class FactsManager {
    
    //MARK: infoList
    var infoListTitle: String?
    var infoListItems: [FactModel] = []
    private let apiClient: APIClient!
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    //get item data from the server
    func getFactsData(_ completion: @escaping ((Result<FactListModel>) -> Void)) {
        //make a call to server to get data
        let resource = Resource(url: URL(string: ResourceURL.resourceURL.rawValue)!)
        apiClient.load(resource) { (result) in
            switch result {
            case .success(let data):
                do {
                    let items = try JSONDecoder().decode(FactListModel.self, from: (data))
                    self.infoListTitle = items.title
                    self.infoListItems = items.rows ?? []
                        completion(.success(items))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                print("\(self) retrive error: \(error) from resource: \(resource)")
            }
        }
        //after getting data set the main information model
        //after model is set than update the viewcontroller
    }
}



