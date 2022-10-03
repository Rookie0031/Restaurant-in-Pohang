

# :iphone: App name: 아, 뭐먹지?
### 포항의 맛집을 추천받고, 마음에 드는 맛집으로 먹킷리스트를 만들어보세요!

- 포항 맛집리스트를 볼 수 있고, 카테고리 선택으로 맛집을 추천받을 수 있습니다.
- 맛집 즐겨찾기를 통해 먹킷리스트를 만들고 관리할 수 있습니다.

## :sparkles: Technology

### UI/UX
- SwiftUI: 모든 UI 구현에 SwiftUI 사용
- NukeUI: URL을 사용하여 이미지를 띄우는 과정에서 캐싱 처리 및 애니메이션을 통한 UX 증진을 위해 Third Party인 NukeUI를 도입하였습니다.  

### Concurrency
- Notion API 연동: 음식점 데이터를 Notion DB를 통해 관리하고 Notion API로 앱 첫 실행시 데이터를 받아옵니다.
- URLSession, async/await: NotionDB에서 데이터를 가져오는 비동기 태스크 구현에 사용되었습니다.
  
### Persistence
- FileManager: 첫 앱 실행시 DB로부터 받아온 데이터를 FileManager에 저장하여 영구 저장하며 이후 앱 구동시 빠르게 데이터를 가져옵니다.

### Design Pattern
- MVVM 구조를 사용했습니다. (단일 ObservableObject로 데이터 플로우 관리)

## :star: Data Flow Chart
App running시 다음과 같은 data flow를 가집니다.

<img width="1000" alt="뭐먹지 데이터플로우(2)" src="https://user-images.githubusercontent.com/103009135/193453266-b85cd315-948e-4581-8304-b5b575cd0894.png">


## :pushpin: Features & Design

[UI Design]
#### 프로토타입 디자인 과정에서 다음 design skill들이 고려되었습니다.
- Gestalt Theory (Similarity & Closure)
- Color Psychology (Primary Color : Orange)


## :people_hugging: Authors

- [@장지수](https://github.com/Rookie0031/)

## :framed_picture: Demo

![Demo_](https://user-images.githubusercontent.com/103009135/167295208-ab3a14dc-d9fa-4218-a70b-a090c697f26e.mp4)




## :fireworks: Screenshots

![FoodListApp](https://user-images.githubusercontent.com/103009135/167294897-a332ac1e-31d5-4c36-8140-38bf3f7a2727.png )


## :books: Documentation

- [Documentation](https://github.com/MMMIIIN/Gominsee). 
- [Documentation](https://github.com/MMMIIIN/wwdc2022). 
- Apple Developer Documentation, SwiftUI Tutorial. 
 


## :lock_with_ink_pen: License
- All the license of food picture is on Naver or individual blogger.

## 향후 계획
1. 유저가 음식점을 제보할 수 있는 기능 개발(POST to Notion DB)
2. 음식점 검색 기능 추가

## About Proejct managing
- Total Project term : 30days
- Ideation/Design : 5days
- MVP Development : 6days
- Revision/Presentation: 2days
- Migration to NotionDB: 14days
- Data Persist: 3days

