
import SwiftUI

struct InformationRowView: View {
    var restaurant : RestaurantData

    var body: some View {
        HStack {
            restaurant.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(restaurant.name)
                .customInfoContent2()
            Spacer()
        }
    }
}
