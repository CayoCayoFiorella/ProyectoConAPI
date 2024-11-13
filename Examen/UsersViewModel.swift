//
//  UsersViewModel.swift
//  Examen
//
//  Created by Fiorella on 13/11/24.
//
import SwiftUI
class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    var page: Int = 1
    let perPage: Int = 10
    var isLoading: Bool = false

    init() {
        Task {
            await loadUsers()
        }
    }
    
    func loadMoreContent(currentItem item: User) {
        guard !isLoading, users.last?.id == item.id else { return }
        page += 1
        Task {
            await loadUsers()
        }
    }
    
    func loadUsers() async {
        isLoading = true
        do {
            let newUsers = try await SupabaseService.shared.fetchUsers(page: page, perPage: perPage)
            DispatchQueue.main.async {
                self.users.append(contentsOf: newUsers)
                self.isLoading = false
            }
        } catch {
            print("Error fetching users: \(error)")
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
}

