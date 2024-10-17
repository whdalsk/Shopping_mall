# 쇼핑몰 프로젝트 | JSP

![image002](https://github.com/user-attachments/assets/2cdde081-1d91-4f4a-ae9a-5a11b1b2cf0f)

<br>

## 프로젝트 소개

JAVA, JSP를 활용해 쇼핑몰을 만들어보았습니다.

<br>

## 개발 언어

![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS](https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white)
![js](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white)
![JAVA](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)

<br>

## 개발 기간

2024.04.09 ~ 2024.04.18

<br>

## 멤버 및 역할

### 김종민(조장)
  - DB 설계 및 구축
  - 상품페이지 리스트, 페이징, 검색 기능 구현
  - 장바구니 기능 구현
  - 전체 파일 통합

### 김영우
  - 프론트엔드 개발
  - 회원가입 기능 구현

### 박성준
  - DB 설계 및 구축
  - 검색, 업로드 기능 구현

### 양정윤
  - 상품 상세페이지 구현
  - 상품 리뷰 기능 구현
  - 상품 찜 기능 구현

### 한다솔
  - 관리자페이지 상품 등록/수정/삭제 구현
  - 상품 좋아요 기능 구현

<br>

## 기능

### 회원가입
- 기본 정보를 적고 유효한 정보가 들어갔을 경우에 회원가입이 된다.

<br>

![image004](https://github.com/user-attachments/assets/5b1c2c1e-8ff3-4c59-bd56-94afe2b16781)

<br>

### 로그인
- 회원가입한 아이디, 비밀번호를 입력 시에 로그인이 된다.

<br>

![image006](https://github.com/user-attachments/assets/e82dedd4-be55-4b5c-bd2f-de57d5d588e6)

<br>

### 메인페이지
- 메인페이지에는 여러 탭이 있는 내비게이션바와 장바구니, 찜 목록 버튼이 있다.

<br>

![image002](https://github.com/user-attachments/assets/2cdde081-1d91-4f4a-ae9a-5a11b1b2cf0f)

<br>

### 상품 목록
- Shop 탭을 클릭 시에 상품 목록 페이지로 이동하게 된다.
- 각 상품들마다 좋아요 버튼과, 장바구니에 담는 버튼이 존재한다.
- 일정 개수가 넘어가면 페이징 기능이 작동한다.

<br>

![image014](https://github.com/user-attachments/assets/fea32993-db2b-47d0-8452-7e4b8151e885)
![image020](https://github.com/user-attachments/assets/17457857-78cb-478d-9cbe-4a698909ea28)

<br>

### 상품 상세페이지
- 상품을 클릭하게 되면 상품 상세페이지로 이동하게 된다.
- 상품 가격과 좋아요, 찜 여부가 나온다.
- 상품 개수를 선택해 결제하거나 장바구니에 담을 수 있다.

<br>

![image028](https://github.com/user-attachments/assets/46d7d400-4396-41ce-9641-9d863002606e)

### 리뷰
- 상품 상세페이지에서 리뷰를 남길 수 있다.

<br>

![image030](https://github.com/user-attachments/assets/cc26266b-4334-49e7-b89d-67930dd22e77)

<br>

### 검색
- 페이지 상단의 검색바를 이용해 상품을 검색할 수 있다.
- 상품의 이름이나 설명을 검색하면 해당 상품이 나오게 된다.

<br>

![image010](https://github.com/user-attachments/assets/c0fefb10-0d26-4210-aacc-fa93d25c17d2)

<br>

### 장바구니
- 상품 목록이나 상세페이지에서 장바구니 담기 버튼을 누를 경우 장바구니에 담기게 된다.
- 장바구니 버튼을 누르면 장바구니 페이지로 이동하게 된다.
- 각 상품들의 개수를 수정할 수 있다.
- 장바구니에 담긴 상품들을 일괄 결제할 수 있다.

<br>

![image048](https://github.com/user-attachments/assets/89869f3d-de12-4f48-aa9d-e618bb80cd7e)

<br>

### 결제
- 결제 버튼을 누를 경우 결제 창이 뜨게 된다.
- 총 상품 가격과 배송비의 합이 최종 결제가격이 된다.
- 결제 api를 가져와 진행하였기에 실제 결제는 진행이 되진 않는다.

<br>

![image050](https://github.com/user-attachments/assets/c411f9b0-dedf-45f5-b5ce-24c48d69034e)

<br>

### 찜
- 상품을 더블클릭 시에 상품이 찜 목록에 들어가게 되고 하트 색깔이 변경된다.
- 찜 목록에서 상품을 삭제할 수 있다.

<br>

![image040](https://github.com/user-attachments/assets/4709fba4-b0c1-42b5-afc1-13b4e3e6007a)
![image042](https://github.com/user-attachments/assets/70f2d7a3-5421-4fa1-8168-10cb98b7f29a)

<br>

### 좋아요
- 상품 위의 좋아요 버튼을 누를 경우 좋아요가 활성화 된다.
- 다시 한번 누를 경우 좋아요가 취소된다.

<br>

![image038](https://github.com/user-attachments/assets/89ea93f3-7949-4b7e-b185-f83c207faf12)

<br>

### 마이페이지
- Mypage 탭을 클릭 시 마이페이지로 진입할 수 있다.
- 마이페이지에서 개인정보를 수정할 수 있다.

<br>

![image008](https://github.com/user-attachments/assets/fdec6d07-9a17-4768-84b4-e96726dbacc9)

<br>

### 관리자페이지
- 관리자페이지는 별도의 주소를 통해 이동한다.
- 관리자페이지에서 상품 등록/수정/삭제 등 상품을 관리할 수 있다.
- FAQ와 문의 등을 관리할 수 있다.

<br>

![image056](https://github.com/user-attachments/assets/0e0318c8-067e-4af5-9fb0-b9689327d004)
![image060](https://github.com/user-attachments/assets/0ab1d9ac-71d7-4ac6-8406-22845dfb23f9)
![image064](https://github.com/user-attachments/assets/5ea6c360-3660-44fc-b490-862d3413f830)

<br>

## 소감
DB설계의 중요성을 알게 되었다. 프로젝트를 진행하다 보니 DB 테이블의 변경이 잦아졌고 이에 따라
조원분들이 헷갈리는 경우가 생기게 되어 시간이 지체가 된 점이 아쉽다. 짧은 기간 동안에 처음에 생각했던 거 보다
많은 기능들을 넣을 수 있어서 좋았다. 장바구니의 상품 수량 변경에서 동기방식으로 진행하는 점에 어려움이 있었다.
다음에는 비동기 방식을 고려해봐야겠다고 생각했다. 전체 파일을 통합하는 과정에서 수정해야하는 코드들이 많다는 것을 느꼈다.
내가 보기 뿐만 아니라 다른 사람이 보기에도 좋은 코드를 작성해야 겠다고 느꼈다.
