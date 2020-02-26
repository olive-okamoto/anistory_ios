//
//  MyProfilePresenter.swift
//  anistory
//
//  Created by RyoOkamto on 2020/02/25.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation

protocol MyProfilePresenter {
    
}

class MyProfilePresenterImpl: MyProfilePresenter, ObservableObject {
    
    private var client = GraphQLApiClient.client
    
    public required init() {
        getProfile()
    }
    
    func getProfile() {
        let result = client.fetch(query: GetViewerInfoQuery(), cachePolicy: .returnCacheDataAndFetch, resultHandler: { result in
            print(result)
        })
    }
    
}
