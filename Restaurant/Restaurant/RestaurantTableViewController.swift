//
//  RestaurantTableViewController.swift
//  Restaurant
//
//  Created by Andrew Hinson on 10/25/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit


class RestaurantTableViewController: UITableViewController {
    //sets the data to be array of restmodels
    var data: [RestaurantModel]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //gives the data value from the data set
        data = Data.sampleData
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //let d = Data.sampleData
        data = Data.sampleData

        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath)

        // Configure the cell...
        
        //makes the cell take data from the data class``
        if let restCell = cell as? RestaurantTableViewCell{
            //you have to use indexPath to get the correct data for the row
            restCell.restName.text = Data.sampleData[indexPath.row].restuarantName
            restCell.restType.text = Data.sampleData[indexPath.row].restuarantType
            if let imageName = Data.sampleData[indexPath.row].restuarantImage {
                restCell.restImage?.image = UIImage(named: imageName)
            }
            else {
                restCell.restImage.image = nil
            }
            
            //sets up image urls in the home page
            if let imageURL = Data.sampleData[indexPath.row].restuarantImgURL{
                let session = URLSession(configuration: .default)
                if let url = URL(string: imageURL){
                    let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                        if let data = data{
                            DispatchQueue.main.async {
                                restCell.restImage.image = UIImage(data: data)
                            }
                            
                            
                        }
                    })
                    task.resume()
                }
            }
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            Data.sampleData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
    }*/
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier {
            if identifier == "restaurantSegue" {
                if let svc = segue.destination as? RestaurantViewController,
                    let cell = sender as? UITableViewCell,
                    let data = data{
                    if let indexPath = tableView.indexPath(for: cell){
                        let restaurant = data[indexPath.row]
                        svc.restaurant = restaurant
                    }
                }
            }
            else {
                print(identifier)
            }
        }
    }
    

}
