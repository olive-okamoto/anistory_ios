//
//  ProfileRouter.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/01.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import SwiftUI

class ProfileRouter: ProfilePresenterToRouterProtocol {
    
    func associatedView() -> AnyView {
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(interactor: interactor, router: self)
        let viewInput = ProfileViewModel()
        viewInput.inject(presenter: presenter)
        let view = ProfileView(viewModel: viewInput)
        interactor.inject(presenter: presenter)
        presenter.inject(viewInput: viewInput)
        return AnyView(view)
    }
    
}
