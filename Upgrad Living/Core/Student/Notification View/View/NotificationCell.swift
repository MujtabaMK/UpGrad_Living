//
//  NotificationCell.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 08/06/23.
//

import SwiftUI

struct NotificationCell: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var arrGetNotifi: [NotificationArray]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            ForEach(Array(arrGetNotifi.enumerated()), id: \.offset) {  index, array in
                VStack(alignment: .leading){
                    NotificationSubCell(
                        categoryID: array.catagoryId,
                        title: array.TitleName,
                        description: array.description
                    )
                }
            }
        }
    }
}
