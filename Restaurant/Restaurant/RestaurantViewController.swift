//
//  RestaurantViewController.swift
//  Restaurant
//
//  Created by Andrew Hinson on 10/30/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {

    @IBOutlet weak var restViewImage: UIImageView!
    @IBOutlet weak var restViewTitle: UILabel!
    @IBOutlet weak var restViewType: UILabel!
    var restaurant: RestaurantModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        restViewTitle.text = restaurant?.restuarantName
        restViewType.text = restaurant?.restuarantType
        if let imageName = restaurant?.restuarantImage{
            restViewImage.image = UIImage(named:imageName )
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
