# studycat

안녕하세요 studycat프로젝트입니다 ㅎωㅎ

1. 작업하기 전 깃허브 확인하고 바뀐게 있다면 pull한 후 작업하기
2. 여러 스크린에서 사용해야 할 것 같은 데이터는 프로바이더 이용하기 (사용법은 밑에 있습니다.)
3. 색깔 데이터는 웬만하면 프로바이더 이용하기
4. 데이터 추가나 사용중 모르는 게 있으면 언제든 연락해주세요

## 프로바이더 사용법 (모든 스크린에서 사용할 수 있는 변수들)

프로젝트 안의 provider/provider.dart에서 확인가능

한 스크린에서 많이 사용할 것 같으면 var 변수이름 = context.watch<사용할 프로바이더 이름>(); 이런식으로 만들어서 사용하면 편합니다. 변수이름.사용할 프로바이더안의 변수이름

현재 있는 프로바이더 
  1. ThemeColor : Color모음
  2. UserData : UserId나 스크린 크기, 유저가 만든 과목 리스트 등 (스크린 크기 width,heigth는 기존에 쓰던 대로 써도 상관없음)
  3. CloudData : 현재 유저의 학습데이터, 학습기록데이터 등

사용법 
  context.watch<사용할 프로바이더 클래스 이름>().클래스에 들어있는 변수 혹은 메서드 이름;
  ThemeColor를 사용하는 예제 : color: context.watch<ThemeColor>().box; (ThemeColor에 있는 box변수를 가져온다)
  한 스크린에서 많이 사용할거같으면 var color = context.watch<ThemeColor>(); 와 같이 선언해놓고 color.box 이렇게 사용할 수 있다.
  
CloudData에서 데이터 가져오는 방법
    1. 점수데이터 
        접근하기
          context.watch<CloudData>().myScore.score['data'][날짜입력][가져올데이터이름입력]
          예제 ) 2023년 5월 24일에 기록된 math시험 점수 가져오기
              context.watch<CloudData>().myScore.score['data']['2023-05-24']['math']
        저장된 형태 간단히 보기
          001(UserId) -> score -> data -> 2023-05-24(날짜) -> 점수, 날짜등의 데이터
        저장된 형태 자세히 보기 (Map으로 되어있음)
          {'001' : {'score' : {'data' : { '2023-05-24' : { 'date' : "2023-05-24" , 'eng' : 100 , 'kor' : 80, 'math' : 0, 'week' : "Wed" }}}}}
          자료형 : Map<String, Map<String, Map<String, Map<String, Map<String, dynamic>>>>>
        
