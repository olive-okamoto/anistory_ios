//
//  ProfilePresenter.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/01.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import RxSwift

enum ProfileStatus {
    case loading
    case normal
    case error
}

class ProfilePresenter: ProfileViewToPresenterProtocol {
    
    var viewInput: ProfilePresenterToViewProtocol?
    var interactor: ProfilePresenterToInteractorProtocol
    var router: ProfilePresenterToRouterProtocol
    
    private let disposeBag = DisposeBag()
    
    init(interactor: ProfilePresenterToInteractorProtocol, router: ProfilePresenterToRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func inject(viewInput: ProfilePresenterToViewProtocol) {
        self.viewInput = viewInput
    }
    
    func fetchProfile() {
        viewInput?.changeStatus(.loading)
        interactor.fetchProfile()
            .subscribe(
                onNext: { [weak self] profile in
                    guard let self = self else { return }
                    self.viewInput?.changeStatus(.normal)
                    self.viewInput?.setProfile(profile: profile)
                },
                onError: { [weak self] _ in
                    guard let self = self else { return }
                    self.viewInput?.changeStatus(.error)
                },
                onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
        
}

extension ProfilePresenter: ProfileInteractorToPresenterProtocol {
}
