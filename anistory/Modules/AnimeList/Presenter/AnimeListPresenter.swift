//
//  AnimeListPresenter.swift
//  anistory
//
//  Created by RyoOkamto on 2020/03/06.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import RxSwift

protocol AnimeListViewToPresenterProtocol {
    func fetch()
}

protocol AnimeListInteractorToPresenterProtocol {
    
}

class AnimeListPresenter {
    private var viewInput: AnimeListPresenterToViewProtocol?
    private var interactor: AnimeListPresenterToInteractorProtocol?
    
    private let disposeBag = DisposeBag()
    
    func inject(viewInput: AnimeListPresenterToViewProtocol, interactor: AnimeListPresenterToInteractorProtocol) {
        self.viewInput = viewInput
        self.interactor = interactor
    }
}

extension AnimeListPresenter: AnimeListViewToPresenterProtocol {
    func fetch() {
        interactor?.fetch()
            .subscribe(
                onNext: { [weak self] list in
                    guard let self = self else { return }
                    self.viewInput?.setList(list.nodes)
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
}
