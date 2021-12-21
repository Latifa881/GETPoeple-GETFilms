//
//  DataModel.swift
//  GETPoeple
//
//  Created by administrator on 20/12/2021.
//

import Foundation

// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let Films = try Films(json)

import Foundation

// MARK: - Films
struct Films : Codable {
    
    let count: Int
    let next, previous: String?
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case  next, previous
        case count
        case results
    }
}

// MARK: - Result
struct Result :Codable {
    let title: String
    let episodeID: Int
    let openingCrawl, director, producer, releaseDate: String
    let characters, planets, starships, vehicles: [String]
    let species: [String]
    let created, edited: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
            case title
            case episodeID = "episode_id"
            case openingCrawl = "opening_crawl"
            case director, producer
            case releaseDate = "release_date"
            case characters, planets, starships, vehicles, species, created, edited, url
        }
}
