//
//  FilmViewController.swift
//  GETPoeple
//
//  Created by administrator on 20/12/2021.
//

import UIKit

class FilmTableViewController: UITableViewController {

    var films : Films?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        StarWarsModel.getAllFilms(completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            // data -> JSON data, response -> headers and other meta-information, error-> if one occurred
            // "do-try-catch" blocks execute a try statement and then use the catch statement for errors
            guard let myData = data else { return }
          
            do {
               
                let decoder = JSONDecoder()
                let jsonResult = try decoder.decode(Films.self, from: myData)
                self.films = jsonResult
               
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
               
                
            } catch {
              print(error.localizedDescription)
            }
        })
        // execute the task and then wait for the response
        // to run the completion handler. This is async!
    
     
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsCell" , for: indexPath)
                // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = films?.results[indexPath.row].title
                // return the cell so that it can be rendered
                return cell
    }
  

}
