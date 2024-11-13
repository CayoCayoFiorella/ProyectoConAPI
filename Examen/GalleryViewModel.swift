//
//  GalleryViewModel.swift
//  Examen
//
//  Created by Fiorella on 13/11/24.
//

import Foundation

class GalleryViewModel: ObservableObject {
    @Published var galleries: [Gallery] = []
    @Published var paintings: [Painting] = []
    
    func loadGalleries() async {
        do {
            let galleries = try await SupabaseService.shared.fetchGalleries()
            DispatchQueue.main.async {
                self.galleries = galleries
            }
        } catch {
            print("Error loading galleries: \(error)")
        }
    }
    
    func loadPaintings(forGallery galleryID: Int) async {
        do {
            let paintings = try await SupabaseService.shared.fetchPaintings(byGalleryID: galleryID)
            DispatchQueue.main.async {
                self.paintings = paintings
            }
        } catch {
            print("Error loading paintings: \(error)")
        }
    }
}

