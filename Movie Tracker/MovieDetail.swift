//
//  MovieDetail.swift
//  Movie Tracker
//
//  Created by Rumin Shah on 8/12/20.
//  Copyright © 2020 Rumin Shah. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    
    @State var movie: Movie
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var movieStore: MovieStore // Use ObservedObject
    
    let isNewMovie: Bool
    
    var body: some View {
        List {
            Section {
                SectionTitle(title: "Movie Name")
                TextField("name", text: $movie.title)
            }
            
            Section {
                SectionTitle(title: "Rating")
                
                HStack {
                    Spacer()
                    Text(String(repeating: "★", count: Int(movie.rating)))
                        .foregroundColor(.yellow)
                        .font(.title)
                    Spacer()
                }
                
                Slider(value: $movie.rating, in: 1...5, step: 1)
            }
            
            Section {
                SectionTitle(title: "Seen")
                Toggle(isOn: $movie.hasSeen) {
                    if movie.title.isEmpty {
                        Text("Has seen this movie?")
                    } else {
                        Text("Has seen \(movie.title)?")
                    }
                }
            }
            
            Section {
                Button(action: {
                    if self.isNewMovie {
                        self.movieStore.movies.append(self.movie)
                    } else {
                        for x in 0..<self.movieStore.movies.count {
                            self.movieStore.movies[x] = self.movie
                        }
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Spacer()
                        Text("save")
                        Spacer()
                    }
                }.disabled(movie.title.isEmpty).foregroundColor(.orange)
            }
            
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(), isNewMovie: true)
    }
}

struct SectionTitle: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.body)
            .foregroundColor(.blue)
    }
}
