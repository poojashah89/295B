//
//  DoctorAppointmentModel.swift
//  DermaCare
//
//  Created by sindhya on 5/3/18.
//  Copyright © 2018 Pooja. All rights reserved.
//

import UIKit

class DoctorAppointmentModel: NSObject {
    
    var patientId: String?
    var patientName: String?
    var patientPhone: String?
    var date: String?
    
    override init()
    {
        
    }
    
    init(patId:String, patName:String, patPhone:String, date: String)
    {
        self.patientId = patId
        self.patientName = patName
        self.patientPhone = patPhone
        self.date = date
    }
}
