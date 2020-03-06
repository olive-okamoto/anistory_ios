//
//  AnimeListViewModel.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/06.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import SwiftUI

protocol AnimeListPresenterToViewProtocol {
    func setList(_ list: [SearchWorksQuery.Data.SearchWork.Node?]?)
}

class AnimeListViewModel: ObservableObject {
    private var presenter: AnimeListViewToPresenterProtocol?
    @Published var list: [SearchWorksQuery.Data.SearchWork.Node?]?
    
    func fetch() {
        presenter?.fetch()
    }
}

extension AnimeListViewModel: AnimeListPresenterToViewProtocol {
    func setList(_ list: [SearchWorksQuery.Data.SearchWork.Node?]?) {
        self.list = list
    }
}
