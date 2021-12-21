//
//  ShowDetailsViewController.swift
//  GETPoeple
//
//  Created by administrator on 21/12/2021.
//

import UIKit

class ShowDetailsViewController: UIViewController {
    
    var passedPerson:PersonDetails?
    var passedFilm:Result?
    
    
    @IBOutlet var detailsLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let passedPerson = passedPerson{
        detailsLabels[0].text = "Name: \(String(describing: passedPerson.Name))"
        detailsLabels[1].text =  "Gender: \(String(describing: passedPerson.Gender))"
        detailsLabels[2].text = "Birth Year: \(String(describing: passedPerson.BirthYear))"
            detailsLabels[3].text =  "Mass: \(String(describing: passedPerson.Mass))"
            
    }
        
        if let passedFilm = passedFilm {
        detailsLabels[0].text = "Title: \(String(describing:  passedFilm.title))"
        detailsLabels[1].text =  "Release Date: \(String(describing: passedFilm.releaseDate))"
        detailsLabels[2].text = "Director: \(String(describing: passedFilm.director))"
        detailsLabels[3].text =  "Opening Crawl: \(String(describing: passedFilm.openingCrawl))"
        
        }
        
    }
    

  

}
