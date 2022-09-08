
import SwiftUI

struct InformationRowView: View {
    var restaurant : Properties

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: restaurant.imageName.richText.first!.text.content)) { image in image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
                .frame(width: 50, height: 50)
            Text(restaurant.name.title.first!.text.content)
                .customInfoContent2()
            Spacer()
        }
    }
}
