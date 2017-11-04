//
//  CreateViewController.swift
//  Restaurant
//
//  Created by Andrew Hinson on 11/3/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    var newRestuarantModel: RestaurantModel?
    
    @IBOutlet weak var createName: UITextField!
    
    @IBOutlet weak var createType: UITextField!
    
    
    @IBOutlet weak var createImage: UITextField!
    
    
    @IBOutlet weak var createBody: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addData(_ sender: UIButton) {
        newRestuarantModel = RestaurantModel.init(restuarantName: (createName.text?.description)!, restuarantType: (createType.text?.description)!, restuarantImage: (createImage.text?.description)!, restuarantBodyText: (createBody.text?.description)!)
        
        Data.sampleData.append(newRestuarantModel!)
        
        
        
       
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
