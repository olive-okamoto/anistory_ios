//
//  AnimeListInteractor.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/05.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import RxSwift

protocol AnimeListPresenterToInteractor {
    func fetch() -> Observable<SearchWorksQuery.Data.SearchWork>
}

class AnimeListInteractor: AnimeListPresenterToInteractor {
    
    private var client = GraphQLApiClient.client
    
    func fetch() -> Observable<SearchWorksQuery.Data.SearchWork> {
        return client.rx.fetch(query: SearchWorksQuery(season: "spring"), cachePolicy: .returnCacheDataAndFetch).asObservable()
            .map { $0.searchWorks }
            .filterNil()
    }
    
}
