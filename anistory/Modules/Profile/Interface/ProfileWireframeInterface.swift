//
//  ProfileWireframeInterface.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/01.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import RxSwift

// MARK: View to Presenter
protocol ProfileViewToPresenterProtocol: AnyObject {
    func fetchProfile()
}

// MARK: Presenter to View
protocol ProfilePresenterToViewProtocol: AnyObject {
    func setProfile(profile: GetViewerInfoQuery.Data.Viewer)
    func changeStatus(_ status: ProfileStatus)
}

// MARK: Presenter to Router
protocol ProfilePresenterToRouterProtocol: AnyObject {
    
}

// MARK: Presenter to Interactor
protocol ProfilePresenterToInteractorProtocol: AnyObject {
    func fetchProfile() -> Observable<GetViewerInfoQuery.Data.Viewer>
}

// MARK: Interactor to Presenter
protocol ProfileInteractorToPresenterProtocol: AnyObject {
}

