//
//  SupabaseManager.swift
//  Examen
//
//  Created by Fiorella on 13/11/24.
//

import Supabase

class SupabaseManager {
    static let shared = SupabaseManager()
    
    let client: SupabaseClient
    
    private init() {
        let url = URL(string: "https://qsafyyqlttkopjprmgrc.supabase.co")!
        let apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFzYWZ5eXFsdHRrb3BqcHJtZ3JjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE0MjcyNzIsImV4cCI6MjA0NzAwMzI3Mn0.ithyCN2kF5K4vb3j8jDN6wNsnelJmubN2O8sO4z6R-s"
        client = SupabaseClient(supabaseURL: url, supabaseKey: apiKey)
    }
}
