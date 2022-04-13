//
//  UserProfilingMovie.swift
//  Challenge 1
//
//  Created by Zacky Ilahi Azmi on 13/04/22.
//

import UIKit

struct UserProfilingMovie {
    let title: String
    let image: UIImage
}

let movies: [UserProfilingMovie] = [
    UserProfilingMovie(title: "Hightown", image: #imageLiteral(resourceName: "hightown")),
    UserProfilingMovie(title: "Penny Dreadful", image: #imageLiteral(resourceName: "pennyDreadful")),
    UserProfilingMovie(title: "The Bold Type", image: #imageLiteral(resourceName: "boldType")),
    UserProfilingMovie(title: "Blindspot", image: #imageLiteral(resourceName: "blindspot")),
    UserProfilingMovie(title: "In the Dark", image: #imageLiteral(resourceName: "inTheDark")),
    UserProfilingMovie(title: "Doom Patrol", image: #imageLiteral(resourceName: "doomPatrol.png")),
    UserProfilingMovie(title: "Agents of S.H.I.E.L.D", image: #imageLiteral(resourceName: "agentsOfShield.png")),
    UserProfilingMovie(title: "The 100", image: #imageLiteral(resourceName: "theHundred")),
    UserProfilingMovie(title: "DC Legends of Tomorrow", image: #imageLiteral(resourceName: "dcLegendsOfShield")),
    UserProfilingMovie(title: "Siren", image: #imageLiteral(resourceName: "siren"))
]
