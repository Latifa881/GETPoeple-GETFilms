//
//  ViewController.swift
//  GETPoeple
//
//  Created by administrator on 20/12/2021.
//

import UIKit

class PeopleViewController: UITableViewController {

    var people = [PersonDetails]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // specify the url that we will be sending the GET request to
        for pageIndex in 1 ... 9{
            StarWarsModel.getAllPeople(pageIndex: pageIndex, completionHandler:  {
                 // see: Swift closure expression syntax
                 data, response, error in
                 // data -> JSON data, response -> headers and other meta-information, error-> if one occurred
                 // "do-try-catch" blocks execute a try statement and then use the catch statement for errors
                 do {
                     // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                     if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                         print(jsonResult)
                         
                         
                         if let results = jsonResult["results"] {
                             // coercing the results object as an NSArray and then storing that in resultsArray
                             let resultsArray = results as! NSArray
                                 // now we can run NSArray methods like count and firstObject
                             for resultOBJ in resultsArray{
                                 let resultDictionaryName =   (resultOBJ as! NSDictionary).value(forKey: "name") as! String
                                 let resultDictionaryGender =   (resultOBJ as! NSDictionary).value(forKey: "gender") as! String
                                 let resultDictionaryBirthYear =   (resultOBJ as! NSDictionary).value(forKey: "birth_year") as! String
                                 let resultDictionaryMass =   (resultOBJ as! NSDictionary).value(forKey: "mass") as! String
                                 
                                 self.people.append(PersonDetails(Name: resultDictionaryName, Gender: resultDictionaryGender, BirthYear: resultDictionaryBirthYear, Mass: resultDictionaryMass))
                                 
                                 DispatchQueue.main.async {
                                 self.tableView.reloadData()
                                 }
                            
                             }
                             
                         }
                             
                     }//NSDictionary
                
                 } catch {
                     print(error)
                 }
             })
             // execute the task and then wait for the response
             // to run the completion handler. This is async!
          
        
    }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell" , for: indexPath)
                // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people[indexPath.row].Name
                // return the cell so that it can be rendered
                return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetails", sender: people[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destination = segue.destination as! ShowDetailsViewController
            destination.passedPerson = sender as? PersonDetails


        }


}

struct PersonDetails{
    var Name :String
    var Gender :String
    var BirthYear:String
    var Mass :String
}
