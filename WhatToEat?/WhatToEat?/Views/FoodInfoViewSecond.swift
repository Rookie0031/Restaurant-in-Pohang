
import SwiftUI

struct FoodInfoViewSecond: View {
    
    @EnvironmentObject var modelData : ModelData
    
    var foodInfo : RestaurantData
    var foodInfoIndex: Int {
        modelData.restaurants.firstIndex(where: { $0.id == foodInfo.id })!}
    
    @State var isActive : Bool = false
    
    var body: some View {
        
        if foodInfo.id < 100 {
            VStack {
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.orange).opacity(0.06)
                        .frame(width: 330, height: 350)
                    
                    VStack{
                        HStack {
                            Text("\(foodInfo.name) 어때요?")
                                .customTitle()
                                .lineLimit(2)
                                .allowsTightening(false)
                            
                            Spacer()
                            
                            FavoriteButton(isFavorite: $modelData.restaurants[foodInfoIndex].isFavorite)
                        }
                        .frame(width: 250, alignment: .leading)
                        
                        
                        foodInfo.image
                            .resizable()
                            .customImageDetail()
                    }
                    .padding(.bottom, 20)
                    
                }
                
                VStack {
                    Group {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.orange).opacity(0.06)
                                .frame(width: 330, height: 160)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("가게이름 : \(foodInfo.name)")
                                    .customDescrbText()
                                
                                Text("가격 : \(foodInfo.price)")
                                    .customDescrbText()
                                
                                
                                Text("위치 : \(foodInfo.location)")
                                    .customDescrbText()
                                
                                Text("리뷰 : \(foodInfo.description)")
                                    .customDescrbText()
                            }
                            .frame(width: 300, alignment: .leading)
                            .padding(.leading,30)
                        }
                    }
                }
                .padding()
                
                Group {
                    NavigationLink{
                        FoodListView()
                            .navigationTitle("맛집을 찾아봐요!")
                    } label:{
                        Text("다른 맛집리스트도 살펴볼래요!")
                            .customButtonFormat()
                    }
                    NavigationLink{
                        BucketListView()
                            .navigationTitle("뭘 먹을까?")
                    } label: {
                        Text("먹킷리스트로 가볼래요!")
                            .customButtonFormat()
                    }
                }
            }
        } else {
            NoRecoView()
        }
    }
}
