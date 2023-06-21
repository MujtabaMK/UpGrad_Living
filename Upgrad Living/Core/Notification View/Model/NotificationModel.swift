//
//  NotificationModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 08/06/23.
//

import Foundation

struct NotificationModel: Codable {
    let NotificationDate: String
    let NotificationArray: [NotificationArray]
}

struct NotificationArray: Codable{
    let catagoryId: String
    let TitleName: String
    let description: String
}


var arrNotificationClick = [
    
    NotificationModel(NotificationDate: "Today",
                      NotificationArray: [
                        NotificationArray(catagoryId: "1", TitleName: "Hostel payment", description: "Rent due in 15 days. Pay Now to renew your contract"),
                        NotificationArray(catagoryId: "1", TitleName: "Hostel room", description: "Your room change request has been confirmed"),
                        NotificationArray(catagoryId: "1", TitleName: "Guest room", description: "Your parent guest room booking has been confirmed"),
                        NotificationArray(catagoryId: "2", TitleName: "Dining", description: "Breakfast timings are changed to   07:00 am - 10:00 am"),
                        NotificationArray(catagoryId: "3", TitleName: "Laundry", description: "Laundry schedule changed for 1st floor"),
                        NotificationArray(catagoryId: "4", TitleName: "Gym & Fitness studio", description: "New equipments added to the gym ")
                      ]),
    NotificationModel(NotificationDate: "Yesterday",
                      NotificationArray: [
                        NotificationArray(catagoryId: "5", TitleName: "Multi-sports turf", description: "Football turf is closed on 12th March from 09:00 am - 08:00 pm for maintenance"),
                        NotificationArray(catagoryId: "6", TitleName: "Healthcare", description: "The clinic is closed on Thursday from 03:00 pm - 04:00 pm"),
                        NotificationArray(catagoryId: "7", TitleName: "Housekeeping", description: "Housekeeping timings are changed for 1st floor from 09:00 am - 12:00 pm on every Thursday"),
                        NotificationArray(catagoryId: "8", TitleName: "Barista coffee", description: "Barista will be closed on 14th May")
                      ]),
    NotificationModel(NotificationDate: "October 11, 2023",
                      NotificationArray: [
                        NotificationArray(catagoryId: "9", TitleName: "Convenience store", description: "The store will be closed on 16th May"),
                        NotificationArray(catagoryId: "10", TitleName: "Approval", description: "Your late night request has been approved for 12th May"),
                        NotificationArray(catagoryId: "11", TitleName: "General", description: "A student wants to lend a book named ‘Harry Potter.’ Interested students can contact admin ")
                      ])
]
