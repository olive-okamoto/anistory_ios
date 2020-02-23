//
//  ApiClient.swift
//  anistory
//
//  Created by RyoOkamto on 2020/02/23.
//  Copyright © 2020 oliveapps. All rights reserved.
//

import Apollo

class GraphQLApiClient {
    private static var baseURL: URL {
        return URL(string: "https://api.annict.com/graphql")!
    }
    
    private static var headers: [AnyHashable : Any] {
        let token = "bg6QVMLWtbE_QGr0ZANjmZBK2CE7lba79tc7SQBOEGE"
        return ["Authorization": "Bearer \(token)"]
    }
    
    private static var configuration: URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = headers
        return config
    }
    
    static var client: ApolloClient = createClient()
    
    private static func createClient() -> ApolloClient {
        let transport = HTTPNetworkTransport(url: baseURL, session: URLSession(configuration: configuration))
        do {
            let fileURL = try temporarySQLiteFileURL()
            let sqliteCache = try SQLiteNormalizedCache(fileURL: fileURL)
            // TODO : import Apollo/SQLite
            //return ApolloClient(networkTransport: transport, store: sqliteCache)
            return ApolloClient(networkTransport: transport)
        } catch {
            return ApolloClient(networkTransport: transport)
        }
    }
    
    private static func temporarySQLiteFileURL() throws -> URL {
        let applicationSupportPath = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first!
        let applicationSupportURL = URL(fileURLWithPath: applicationSupportPath)
        
        let temporaryDirectoryURL = try FileManager.default.url(
            for: .cachesDirectory,
            in: .userDomainMask,
            appropriateFor: applicationSupportURL,
            create: true)
        return temporaryDirectoryURL.appendingPathComponent("db.sqlite3")
    }
}

