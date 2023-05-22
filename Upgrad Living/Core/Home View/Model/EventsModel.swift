//
//  EventsModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 11/05/23.
//

import Foundation

struct EventsModel: Identifiable, Equatable{
    var id = UUID().uuidString
    var eventImage: String
    var title: String
    var time: String
    var dateFull: String
    var day: String
    var month: String
    var address: String
    var isSelect : Bool
}

var arrEvents1 = [
    EventsModel(eventImage: "Event_1", title: "Campus event", time: "11 pm", dateFull: "May 2, 2022", day: "2" ,month: "May", address: "Unwind Lounge", isSelect: false),
    
    EventsModel(eventImage: "Event_2", title: "Music Fest", time: "11 pm", dateFull: "May 2, 2022", day: "2" ,month: "May", address: "The Lounge", isSelect: false),
    
    EventsModel(eventImage: "Event_3", title: "Workshop", time: "11 pm", dateFull: "May 2, 2022", day: "2" ,month: "May", address: "The Lounge", isSelect: false),
    
    EventsModel(eventImage: "Event_4", title: "Reading club event", time: "11 pm", dateFull: "May 2, 2022", day: "2" ,month: "May", address: "The Lounge", isSelect: false),
]
