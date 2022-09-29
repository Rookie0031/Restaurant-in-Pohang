import NukeUI
import SwiftUI

struct RestaurantInfoRow: View {
    var restaurant : Properties

    var body: some View {
        HStack {

            LazyImage(source: restaurant.imageFile.files.first!.file.url) { state in
                if let image = state.image {
                    image
                } else if state.error != nil {
                    Text("Error")
                } else {
                    Text("이미지를 받아오고 있어요!")
                        .foregroundColor(.detailBlack)
                }
            }
            .frame(width: 50, height: 50)

            Text(restaurant.name.title.first!.text.content)
                .customInfoContent2()
            
            Spacer()
        }
    }
}
