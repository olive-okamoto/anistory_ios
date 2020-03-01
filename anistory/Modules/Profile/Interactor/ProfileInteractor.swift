//
//  ProfileInteractor.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/01.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import RxSwift

class ProfileInteractor: ProfilePresenterToInteractorProtocol {
    
    var presenter: ProfileInteractorToPresenterProtocol?
    
    private var client = GraphQLApiClient.client
    
    func setup(presenter: ProfileInteractorToPresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchProfile() -> Observable<GetViewerInfoQuery.Data.Viewer> {
        return client.rx.fetch(query: GetViewerInfoQuery(), cachePolicy: .returnCacheDataAndFetch).asObservable()
        .map { $0.viewer }
        .filterNil()
    }
    
}
