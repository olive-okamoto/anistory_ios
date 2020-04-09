//
//  AnimeListRouter.swift
//  anistory
//
//  Created by RyoOkamto on 2020/04/09.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import SwiftUI

protocol AnimeListPresenterToRouterProtocol {
}

class AnimeListRouter: AnimeListPresenterToRouterProtocol {
    
    func associatedView() -> AnyView {
        let interactor = AnimeListInteractor()
        let presenter = AnimeListPresenter()
        let viewInput = AnimeListViewModel()
        let view = AnimeListView(viewModel: viewInput)
        presenter.inject(viewInput: viewInput, interactor: interactor)
        return AnyView(view)
    }
    
}
