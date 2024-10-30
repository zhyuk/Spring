## 국비지원 자바 기반 풀스택 웹개발자 훈련 프로젝트

## 담당업무
    - 스프링 프레임워크 사용.
    - 커뮤니티 페이지 내 밸런스게임과 같은 재미요소가 담긴 VS 페이지, 헤더 및 인덱스 페이지.

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