//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Андрей Бородкин on 02.07.2021.
//

import Foundation

struct Athlete {
    var name: String
    var age: Int
    var league: String
    var team: String
    
    var description: String {
        return "\(name) is \(age) years old, and plays for team \(team) in the \(league) league."
    }
}
