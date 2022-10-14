

# :iphone: App name: 아, 뭐먹지?
### 포항의 맛집을 추천받고, 마음에 드는 맛집으로 먹킷리스트를 만들어보세요!

- 포항 맛집리스트를 볼 수 있고, 카테고리 선택으로 맛집을 추천받을 수 있습니다.
- 맛집 즐겨찾기를 통해 먹킷리스트를 만들고 관리할 수 있습니다.

# :sparkles: Technology

## 📱UI/UX
### UI
#### 모든 UI 구현에 SwiftUI를 사용하였습니다.
 본 프로젝트는 Apple Developer Academy에서 SwiftUI 연습용 프로젝트로 시작했기때문에 SwiftUI를 사용하게 되었습니다. 
SwiftUI는 property Wrapper를 사용해 변수의 변화에 따라 자동으로 뷰를 업데이트합니다. 따라서 UIkit과 비교하면 유저의 interaction에 따른 변화를 빠르게 읽고 뷰를 다시 그려주는 장점이 있기에 뷰 상태가 자주 변하는 앱에 용이합니다. 이 프로젝트에선 가로 스크롤형태로 움직이는 카테고리나, 음식점 즐겨찾기에 관한 UI을 그리는데는 UIkit보다 러닝컴브가 짧다느 장점이 있다고 볼 수 있습니다.

### UX
#### Image 캐시 및 업로드에 NukeUI가 사용되었습니다. 
 AsychImage를 통해 개발하던 중 이미지 로딩 지연 문제가 발생하였습니다. AsyncImage는 이미지 URL을 사용하여 URLSession을 통해 이미지를 로딩하는 Struct으로 따로 URLSession 통신 코드르 작성할 필요가 없다는 장점이 있지만 이미지 캐싱기능이 없어 매번 http 통신을 하기 때문에 로딩 지여 문제가 발생합니다.
이에 NukeUI를 사용했습니다. URL을 사용하여 이미지를 띄우는 과정에서 캐싱 처리 및 애니메이션을 통한 UX 증진을 위해 Third Party인 NukeUI를 도입하였습니다. 이러한 후보군으로는 ~~ 한 것들이 있지만 

## 📡Concurrency
#### Notion API 연동: 음식점 데이터를 Notion DB를 통해 관리하고 Notion API로 앱 첫 실행시 데이터를 받아옵니다.
음식점 데이터는 많은 추가와 수정이 이루어질텐데 그 때마다 앱을 업데이트하는 것이 비효율적이라고 생각했습니다. 하지만 서버 구축에 대한 경험이 없었기에 Notion API를 이용하기로 했습니다. Notion으로 API 활용 경험을 하고 추후 데이터 업로드에도 용이하다고 판단했습니다.

#### URLSession, async/await: NotionDB에서 데이터를 가져오는 비동기 태스크 구현에 사용되었습니다.
URLSession으로 통시 구조를 이용하는것은 completion Hanlder가 있습니다. URLSession aync await를 사용하여 직관적이 코드 구조르 테스트 해보았습니다. 
  
## 💾Persistence
- FileManager: 첫 앱 실행시 DB로부터 받아온 데이터를 FileManager에 저장하여 영구 저장하며 이후 앱 구동시 빠르게 데이터를 가져옵니다.

## ⚜️Design Pattern
- MVVM 구조를 사용했습니다. (단일 ObservableObject로 데이터 플로우 관리)
MVVM의 장점으 ~~ 입니다. 여기 앱의 특성상 ~~ 맞습니다. 

# :star: Data Flow Chart
App running시 다음과 같은 data flow를 가집니다.

<img width="1000" alt="뭐먹지 데이터플로우(2)" src="https://user-images.githubusercontent.com/103009135/193453266-b85cd315-948e-4581-8304-b5b575cd0894.png">


## :pushpin: Features & Design

[UI Design]
#### 프로토타입 디자인 과정에서 다음 HIG 요소들이 고려되었습니다. 
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

