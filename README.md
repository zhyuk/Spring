## 국비지원 자바 기반 풀스택 웹개발자 훈련 프로젝트

## 담당업무
    - 스프링 프레임워크 사용.
    - 커뮤니티 페이지 내 밸런스게임과 같은 재미요소가 담긴 페이지
        -> 글 목록보기, 글 작성, 글 수정, 글 삭제, 투표, 댓글 목록, 댓글 작성, 댓글 수정, 댓글 삭제
    - 헤더 및 인덱스 페이지
        -> 헤더 및 사용자/관리자 인덱스 페이지 전반적인 프론트 영역

## 구현계획
    - VS 페이지에서 투표 버튼 또는 이미지 클릭 시 ajax를 이용하여 데이터 처리.
    - 투표의 정보가 담긴 데이터베이스에 투표한 ID가 세션에 담겨있는 ID와 동일한 경우, 투표할 수 없도록 구현 계획.


## DAY 1
    - 헤더 반응형 및 로그인 여부에 따라 다르게 출력되는 메뉴 1차 구현 완료. => 로그인 부분과 취합된 이후 세세한 작업 필요함.

## DAY 2
    - 커뮤니티 인덱스 페이지 전체글 목록 출력되는 부분 구현 완료. 
    - 커뮤니티 세부 글 페이지 클릭된 글의 데이터만 출력되도록 구현 완료. 다시 인덱스 페이지로 이동할 수 있는 버튼 구현 및 연결 완료.
    - 커뮤니티 글 작성 페이지 제목, 내용, 사진 2가지 모두 입력하지 않을 시 폼 태그의 action기능 비활성화 구현 완료. 모두 작성 시 파일명만 데이터베이스에 저장. 실질적인 파일은 폴더에 저장 => 호스팅 이후 경로 수정작업 필요함.
    - 커뮤니티 글 작성 완료 시 인덱스 페이지로 이동되도록 구현. 이동됐을 때는 방금 작성한 글도 출력됨.

## DAY 3
    - 커뮤니티 글 수정페이지 이동 시 기존의 데이터를 기본값으로 되도록 구현 완료. -> file 타입의 input태그는 다른 방법으로 구현 예정
    - 세부 글 페이지에서 삭제 시 되묻는 창 출력. 되묻는 창에서도 삭제를 원할 시 삭제되는 로직 구현 완료. 삭제 완료 후 인덱스 페이지로 이동하도록 구현.
    - 세부 글 페이지에서 밸런스게임과 같은 투표 ajax로 처리하도록 구현 중.(글 번호, 좌/우 중 선택한 값까지는 ajax로 넘겨 데이터베이스에 데이터 추가까지 구현 완료)

## DAY 4
    - 세부 글 페이지 로드 시 해당 글에 작성된 댓글 데이터 모두 출력되도록 구현 완료, 해당 글에 투표된 데이터 출력되도록 구현 완료.
    - 세부 글 페이지에서 밸런스게임과 같은 투표 ajax로 처리하도록 구현 완료. 
    - 댓글 작성 시 ajax로 처리하여 댓글 추가되는 것, 댓글 삭제 시 ajax로 처리하여 댓글 삭제되는 것 구현 완료.
    
    * 발생에러
    1. ajax로 댓글 삭제 시 POST URL 404 에러 출력되지만 새로고침하면 해당 댓글이 삭제처리는 됨. => 컨트롤러에서 반환값이 문자열일 경우 경로로 인식하는 문제를 해결하기 위한 @ResponseBody 어노테이션을 기술하지 않아 반환된 문자열을 경로로 인식함.

## DAY 5
    - 글 수정 시 이미지 수정 X/ 이미지 하나만 수정 / 이미지 모두 수정 모두 수정되도록 구현 완료.
    - ajax 처리 후 새로고침을 강제로 시키는 기존 방식에서 댓글 리스트를 반환받아 자식요소로 추가하도록 처리 완료.

## DAY 6
    - 커뮤니티 인덱스 페이지 페이징처리 완료.
    - 관리자 커뮤니티 페이지 구현 완료. 
    - 관리자 페이지 전반적인 구조 + 헤더 등 구현 완료.
    - 세션에 담긴 로그인 정보와 비교해 글 작성자 / 댓글 작성자일 경우에만 수정, 삭제 버튼이 나타나도록 구현 완료. => 로그인 로직과 취합 후 수정작업 필요함.

## DAY 7
    - 1차 취합 완료. => 로그인 로직 구현한 팀원에 맞춰 세션정보와 같은 필요한 정보 수정 필요.
    - 이미지 파일 업로드 시 파일명 중복을 방지하기 위해 파일명 "업로드시간+기존파일명"으로 변경 후 DB 추가 로직 구현 완료.
    - 글 삭제 시 해당 글에 담겨있던 댓글, 투표정보 모두 삭제되도록 구현 완료.
    - ajax 처리 후 댓글 리스트를 반환받아 자식요소로 추가될 때 세션에 담긴 로그인 정보와 댓글 작성자가 동일할 때만 수정/삭제 버튼이 나오도록 구현 완료. => 현재는 댓글 수정에만 구현 완료. 나머지 수정 필요.
    
## DAY 8
    - 댓글 작성, 댓글 수정 ajax 처리 후 세션에 담긴 로그인 정보와 댓글 작성자가 동일할 때만 수정/삭제 버튼 나오도록 구현 완료.
    - 관리자 페이지 글 배치 수정 및 ajax 처리 후 자식요소로 추가되는 부분 수정 완료.
    - 대댓글 구현을 위한 함수 작성 완료.(기본적인 구조 완성)

## DAY 9
    - 대댓글 구현 완료. -> 댓글과 동일하게 ajax 처리 후 대댓글 작성자와 로그인한 정보가 동일할 때만 수정/삭제 버튼이 나오도록 구현 완료.
    - 게시글 삭제 시 폴더에 있는 실제 이미지 파일도 함께 삭제되도록 처리 완료. -> 추후 웹서버로 구현 시 서버에 담긴 실제 이미지 파일 삭제되도록 수정 필요.
    - 게시글 작성 및 게시글 수정 시 이미지 사이즈 수정.

## DAY 10
    - 게시글 검색기능 구현 완료. -> 글 세부페이지, 글 수정 후에 목록으로 가도 검색내용 및 페이징처리 유지되도록 구현완료.
    - 게시글에 작성된 댓글수 표시 기능 구현 완료.

## DAY 11
    - 댓글 입력창 input에서 textarea로 변경. (댓글에도 띄어쓰기 및 줄 바꿈 가능하도록)
    - 게시글 작성 페이지에서도 이미지 미리보기 기능 구현.
    - 1차 디자인 작업 시작. -> 팀원과의 회의를 통한 컬러 선정 완료했으나 색 변경이 필요한 듯하여 재회의 필요

## DAY 12
    - 디자인 작업 진행 중.
    - 다른 팀원의 부트스트랩 사용으로 인해 의도치 않은 오류를 방지하기 위해 나의 페이지에서 해당 태그 삭제하는 코드 생성.
    - ajax 처리 후 버튼의 위치가 움직이는 것 해결. -> float 이후 clear 해주지 않음.

## DAY 14
    - 커뮤니티 관리자 페이지 구조 재구성. 
    - 커뮤니티 관리자 페이지 내 댓글 삭제 기능 추가.
    - 메인색상 재선정 후 디자인 재작업

## DAY 15
    - 관리자, 사용자 인덱스 페이지 디자인 작업완료.
    - 사용자 인덱스 페이지 최근 작성된 게시글 및 중고품 데이터 가져와 출력하도록 구현 완료.
    - 사용자 인덱스 페이지 새상품 데이터 랜덤하게 가져오도록 구현 완료.
    - 재미요소가 담긴 커뮤니티 페이지 CSS 작업 시작.

## DAY 16
    - 사용자 헤더 수정 및 반응형 작업 진행 중.
    - 사용자 인덱스 페이지 반응형 작업 완료.
    - 관리자 인덱스 페이지 최근 작성된 상품 데이터, 게시글 데이터, 사용자 데이터 5개씩 출력하도록 구현 완료.
    - 관리자 인덱스 페이지 기본 CSS 작업 완료.

## DAY 17
    - 사용자 헤더 반응형 작업 완료.
    - 커뮤니티 VS 인덱스 반응형 작업 완료.
    - 커뮤니티 VS 글 상세페이지 반응형 작업 완료. -> 댓글부분은 작업 필요.
    - 커뮤니티 VS 글 작성, 수정 페이지 반응형 작업 중.
    - URL을 직접 입력하여 관리자 영역에 이동하는 경우를 방지하기 위해 관리자 미로그인 시 관리자 로그인 페이지로 이동하도록 처리 완료.

## DAY 18
    - 전체적인 디테일 재작업 필요.
    - 관리자 인덱스 내 차트 라이브러리 구현 완료. -> 7일 기준의 정보가 담기도록 수정 필요.