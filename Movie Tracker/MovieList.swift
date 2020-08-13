//
//  MovieList.swift
//  Movie Tracker
//
//  Created by Rumin Shah on 8/12/20.
//  Copyright © 2020 Rumin Shah. All rights reserved.
//

import SwiftUI

struct MovieList: View {
    @EnvironmentObject var movieStore: MovieStore // Use ObservedObject
    
    var body: some View {
        
        NavigationView {
            List(movieStore.movies) { selectedMovie in
                NavigationLink(destination: MovieDetail(movie: selectedMovie,
                                                        isNewMovie: false)) {
                    Text(selectedMovie.title)
                }
            }.navigationBarTitle("Movies").navigationBarItems(trailing:
                NavigationLink(destination: MovieDetail(movie: Movie(),
                                                        isNewMovie: true)) {
                        Image(systemName: "plus").foregroundColor(.orange)
            })
        }
        
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
