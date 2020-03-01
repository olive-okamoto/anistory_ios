//
//  ProfilePresenter.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/01.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import RxSwift

class ProfilePresenter: ProfileViewToPresenterProtocol {
    
    var viewInput: ProfilePresenterToViewProtocol?
    var interactor: ProfilePresenterToInteractorProtocol
    var router: ProfilePresenterToRouterProtocol
    
    private let disposeBag = DisposeBag()
    
    init(interactor: ProfilePresenterToInteractorProtocol, router: ProfilePresenterToRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func setup(viewInput: ProfilePresenterToViewProtocol) {
        self.viewInput = viewInput
    }
    
    func fetchProfile() {
        interactor.fetchProfile()
            .subscribe(
                onNext: { [weak self] profile in
                    guard let self = self else { return }
                    // TODO: Pass data to a view
                    self.viewInput?.setProfile(profile: profile)
                }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
        
}

extension ProfilePresenter: ProfileInteractorToPresenterProtocol {
}
