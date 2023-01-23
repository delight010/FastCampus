//
//  UserProfileViewModel.swift
//  GithubUserSearch
//
//  Created by Seong A Oh on 2023/01/22.
//

import Foundation
import Combine

final class UserProfileViewModel: ObservableObject {
    let loginID: String
    let network: NetworkService
    
    //Published 자동 업데이트
    @Published var selectedUser: UserProfile?
    
    var subscriptions = Set<AnyCancellable>()
    
    init(network: NetworkService, loginID: String) {
        self.network = network
        self.loginID = loginID
    }
    
    var name: String {
        return selectedUser?.name ?? "n/a"
    }
    
    var login: String {
        return selectedUser?.login ?? "n/a"
    }
    
    var followers: String {
        guard let value = selectedUser?.followers else { return "" }
        return "followers: \(value)"
    }
    
    var following: String {
        guard let value = selectedUser?.following else { return "" }
        return "following: \(value)"
    }
    
    var imageURL: URL? {
        return selectedUser?.avatarUrl
    }
    
    // User Action => Input
    func search(keyword: String) {
        let resource: Resource<UserProfile> = Resource(
            base: "https://api.github.com/",
            path: "users/\(keyword)",
            params: [:],
            header: ["Content-Type": "application/json"]
        )
        
        network.load(resource)
            .receive(on: RunLoop.main) // 메인스레드에서 실행
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error): // 실패 시
                    self.selectedUser = nil
                    print("error: \(error)")
                case .finished: // 종료 시
                    break
                }
            }, receiveValue: { user in
                self.selectedUser = user
            })
            .store(in: &subscriptions)
    }
}
