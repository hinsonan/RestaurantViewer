//
//  RestaurantModel.swift
//  Restaurant
//
//  Created by Andrew Hinson on 10/26/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import Foundation

class RestaurantModel{
    //makes all the attributes a restaurant would have
    var restuarantName: String = ""
    var restuarantType: String = ""
    var restuarantImage: String?
    var restuarantBodyText: String = ""
    
    init (restuarantName: String, restuarantType: String, restuarantBodyText: String){
        self.restuarantName = restuarantName
        self.restuarantType = restuarantType
        self.restuarantBodyText = restuarantBodyText
    }
    
    convenience init(restuarantName: String, restuarantType: String, restuarantImage: String, restuarantBodyText: String){
        self.init(restuarantName: restuarantName, restuarantType: restuarantType, restuarantBodyText: restuarantBodyText)
        self.restuarantImage = restuarantImage
    }
}
