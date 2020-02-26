//
//  Apollo+Rx.swift
//  anistory
//
//  Created by RyoOkamto on 2020/02/26.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Foundation
import RxSwift
import Apollo

public enum RxApolloError: Error {
    case graphQLErrors([GraphQLError])
}

public final class ApolloReactiveExtensions {
    private let client: ApolloClient

    fileprivate init(_ client: ApolloClient) {
        self.client = client
    }
    
    public func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .returnCacheDataElseFetch,
        queue: DispatchQueue = DispatchQueue.main) -> Observable<Query.Data> {
        return Observable.create { observer in
            let cancellable = self.client.fetch(query: query, cachePolicy: cachePolicy, queue: queue, resultHandler: { result in
                switch result {
                case .success(let value):
                    if let data = value.data {
                        observer.on(.next(data))
                    } else {
                        observer.on(.completed)
                    }
                case .failure(let error):
                    observer.on(.error(error))
                }
            })

            return Disposables.create {
                cancellable.cancel()
            }
        }
    }

    public func watch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .returnCacheDataElseFetch,
        queue: DispatchQueue = DispatchQueue.main) -> Observable<Query.Data> {
        return Observable.create { observer in
            let watcher = self.client.watch(query: query, cachePolicy: cachePolicy, queue: queue, resultHandler: { result in
                switch result {
                case .success(let value):
                    if let data = value.data {
                        observer.on(.next(data))
                    } else {
                        observer.on(.completed)
                    }
                case .failure(let error):
                    observer.on(.error(error))
                }
            })

            return Disposables.create {
                watcher.cancel()
            }
        }
    }
    
    public func perform<Mutation: GraphQLMutation>(mutation: Mutation, queue: DispatchQueue = DispatchQueue.main) -> Maybe<Mutation.Data> {
        return Maybe.create { maybe in
            let cancellable = self.client.perform(mutation: mutation, queue: queue, resultHandler: { result in
                switch result {
                case .success(let value):
                    if let data = value.data {
                        maybe(.success(data))
                    } else {
                        maybe(.completed)
                    }
                case .failure(let error):
                    maybe(.error(error))
                }
            })

            return Disposables.create {
                cancellable.cancel()
            }
        }
    }
}

public extension ApolloClient {
    var rx: ApolloReactiveExtensions { return ApolloReactiveExtensions(self) }
}
