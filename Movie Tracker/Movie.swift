//
//  Movie.swift
//  Movie Tracker
//
//  Created by Rumin Shah on 8/12/20.
//  Copyright © 2020 Rumin Shah. All rights reserved.
//

import Foundation

struct Movie: Identifiable {
    var id = UUID()
    var title: String = ""
    var rating: Double = 3.0
    var hasSeen: Bool = false
}

class MovieStore: ObservableObject {
   @Published var movies = [Movie]()
}
