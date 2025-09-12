# 📚 NFLibrary

**NFLibrary**는 JSP/Servlet 기반의 도서관 웹 애플리케이션입니다.  
도서 검색과 대출/반납, 희망도서 신청, 공지사항, 회원 관리 기능을 제공하며,  
DAO–Service–Controller의 MVC 아키텍처로 구현되었습니다.

---

## 🚀 주요 기능
- **도서 관리**
  - 도서 검색 및 상세 조회
  - 대출, 반납, 희망도서 신청
- **회원 관리**
  - 회원가입, 로그인/로그아웃
  - 마이페이지(정보 수정, 탈퇴, 대출 내역 확인)
- **공지사항**
  - 공지사항 등록, 수정, 삭제, 조회
- **공통**
  - 에러 처리 페이지
  - 공통 레이아웃(header/footer)

---

## 🛠 기술 스택
- **Language**: Java
- **Web**: JSP, Servlet
- **Server**: Apache Tomcat 11
- **DB**: Oracle (JDBC Template 이용)
- **Build/IDE**: Eclipse (Dynamic Web Project)

---

## [ 맡은 부분 ] - 신선호 -
- 회원관리                      (프론트 / 백엔드) 
- 메인페이지                    (프론트 / 백엔드) 
- 메인페이지 검색기능            (프론트 / 백엔드)
- 도서관 이용안내 페이지         (프론트 / 백엔드) 
- 로그인 후 메인페이지           (프론트 / 백엔드) 
- 로그인 / 로그아웃              (프론트 / 백엔드) 
- 회원가입 페이지                (프론트 / 백엔드)
- 마이페이지 메인                (프론트 / 백엔드)
- 마이페이지 회원탈퇴            (프론트 / 백엔드) 
- 마이페이지 내정보수정          (프론트 / 백엔드) 
- 마이페이지 대출 조회           (프론트 / 백엔드) 
- 마이페이지 희망도서신청조회     (프론트 / 백엔드)
- 네비 밑 푸터 서블렛연결        (프론트 / 백엔드) 
- 웹 디자인                     (공통)
- DB 테이블 작성                (공통)

---

## [ 맡은 부분 ] - 김승재 -
-  희망 도서 신청 페이지          	(프론트 / 백엔드)
> 관리자 희망 도서 관리 기능
-  희망 도서 신청 작성 페이지      	(프론트 / 백엔드)
-  내 도서 신청 조회 페이지   			(프론트 / 백엔드)
-  도서 조회 페이지								(프론트 / 백엔드)
> 도서 대출 기능
-  마이페이지 대출 조회							(프론트 / 백엔드)
-  마이페이지 희망도서신청조회     	(프론트 / 백엔드)
-  로그인 페이지  									(프론트)
-  웹 디자인												(공통)
- DB 테이블 작성                   (공통)
---

## [ 맡은 부분 ] - 안태현 -
- 공지사항
- 공지사항 등록 (프론트 / 백엔드)
- 공지사항 삭제 (프론트 / 백엔드)
- 공지사항 목록 (프론트 / 백엔드)
- 메인 검색기능 (프론트 / 백엔드)
- 웹 디자인     (공통)
- DB 테이블 작성(공통)
---

## 📚 KH Library – JSP/Servlet
- 회원가입/로그인, 마이페이지, 희망도서(위시북) 조회, 계정삭제 흐름등 대출조회 및 공지사항을 JSP · Servlet · JSTL로 구현했습니다.
Servlet (Controller) <br>
  ↓ <br>
Service <br>
  ↓ <br>
DAO (JDBC) <br>
  ↓ <br>
DB <br>
  ↑ <br>
JSP(View)  ←  forward by Controller <br>
이 순서대로 구현하였습니다.

---

아직 프론트 쪽으로는 완전하지 않습니다!!!
백엔드 기능도 마찬가지!!!
---

## 구현 페이지
1. 메인페이지
<img width="1920" height="1080" alt="메인페이지" src="https://github.com/user-attachments/assets/9ba1303b-3785-43ba-86b2-4bb5bf01c044" /> <br>
2. 로그인페이지
<img width="1920" height="1080" alt="로그인페이지" src="https://github.com/user-attachments/assets/67802d38-8440-4a3a-8f18-a08687597c67" /> <br>
3. 로그인 후 메인 페이지
<img width="1920" height="1080" alt="로그인후페이지" src="https://github.com/user-attachments/assets/f28e7670-fa54-4f50-8bf9-250c64399e9d" /> <br>
4. 회원 가입 페이지
<img width="1395" height="785" alt="회원 가입 페이지" src="https://github.com/user-attachments/assets/4bb5605d-3dc7-460a-b2fc-918f16f1c2ee" /> <br>
5. 도서관 이용안내 페이지 
<img width="954" height="875" alt="도서관이용안내" src="https://github.com/user-attachments/assets/0abb4e63-a42c-4ac4-bcb7-c494f053c923" /> <br>
6. 공지사항 메인 페이지
<img width="1920" height="1080" alt="공지사항메인" src="https://github.com/user-attachments/assets/85379d14-64ee-49a7-8fd6-f590e5291352" /> <br>
7. 공지사항 등록 페이지(관리자)
<img width="892" height="851" alt="공지사항등록" src="https://github.com/user-attachments/assets/88619619-86c3-4420-83d7-909de2bfa469" /> <br>
8. 공지사항 디테일 페이지
<img width="1140" height="867" alt="공지사항디테일" src="https://github.com/user-attachments/assets/1692c473-714f-40b5-a6e0-69f750af3a91" /> <br>
10. 공지사항 삭제(버튼)(관리자일때만)
<img width="1145" height="876" alt="공지사항삭제" src="https://github.com/user-attachments/assets/3b6d6794-8f44-4888-ab4e-5e8dbe68766d" /> <br>
11. 서적검색
<img width="1920" height="1080" alt="서적검색" src="https://github.com/user-attachments/assets/91bfbd16-3586-41d8-be8f-0a91018e959d" /> <br>
12. 검색란 검색
<img width="1920" height="1080" alt="석적검색검색란" src="https://github.com/user-attachments/assets/a5a71c71-2371-478e-96f6-ec10cdf8978c" /> <br>
13. 희망도서신청(메인)
<img width="1920" height="1080" alt="희망도서신청" src="https://github.com/user-attachments/assets/53d14cc5-b3c8-4492-9aa9-e481697a6c6d" /> <br>
14. 희망도서신청(글쓰기)
<img width="1920" height="1080" alt="희망도서글쓰기" src="https://github.com/user-attachments/assets/16a20f0c-8514-4804-b200-b26e1904e92b" /> <br>
15. 도서대출
<img width="1920" height="1080" alt="도서대출" src="https://github.com/user-attachments/assets/c62250dc-7980-4fb4-9197-6af3822669f9" /> <br>
16. 도서대출(신청)
<img width="1920" height="1080" alt="도서대출신청" src="https://github.com/user-attachments/assets/2a3ddeb9-a7f0-4d79-9b5a-4b39b4832d42" />
17. 도서대출(신청후)
<img width="1920" height="1080" alt="도서대출신청후" src="https://github.com/user-attachments/assets/bc8f9705-943a-4217-af71-182be4420cb9" />
18. 마이페이지
<img width="1920" height="1080" alt="마이페이지" src="https://github.com/user-attachments/assets/0e990f8c-6508-4650-9a2f-82090813100f" />
19. 내정보 수정
<img width="1920" height="1080" alt="내정보수정" src="https://github.com/user-attachments/assets/78da7363-2589-4340-994b-dc1fad12ae2a" />
20. 대출조회
<img width="1920" height="1080" alt="대출조회" src="https://github.com/user-attachments/assets/3d631ebf-555d-43e5-a2a8-cdd1236c97db" />
21. 희망도서 신청조회
<img width="1920" height="1080" alt="희망도서신청조회" src="https://github.com/user-attachments/assets/844bfd8b-4ced-46df-81e7-2f813f271aa3" />
22. 회원탈퇴
<img width="1920" height="1080" alt="회원탈퇴" src="https://github.com/user-attachments/assets/5a860961-b456-4360-bb41-7b65eccde62f" />



## 소감
- 신선호 <br>
이번 프로젝트에서 팀장역할으로써 각 파트 분배와 소통을 원활히 이끌지 못해 아쉬움이 큽니다.<br>
DB 수정·추가와 기능 변경 과정에서 기준점을 명확히 정하지 못해 팀 방향이 흩어졌고, 그 결과 일정 조율과 관리에 어려움이 있었습니다.<br>
또한 AI 생성 코드를 무분별하게 도입하면서 코드 스타일과 주석 기준이 통일되지 않아 이해·통합에 과도한 시간이 소요되었습니다.<br>
이번 경험을 통해 개발능력의 부족함, 책임감, 의사소통, 기준 설정, 그리고 통일성의 중요성을 절실히 깨달았습니다.<br>
다음 프로젝트에서는 초기 합의된 규칙과 절차를 바탕으로 일관된 개발성을 적용하여 발전하겠습니다. <br>
- 안태현 <br>
HTML까지는 어찌저찌 할 수 있었겠지만 백엔드에 넘어갈때에는 수업시간에 배웠던 내용들의 응용이였지만 처음부터 어떻게 손을 대야할지도 모르겠다보니
강사님께 많이 질문을 했던거 같습니다<br>
진행하면서 어려움들도 많았고 모르는것뿐이었지만 그래도 어떻게 팀프로젝트가 진행되는 것인지 흘러가는 방향들을 조금은 알게되었던거 같았습니다<br>
- 김승재 <br>
원래 하던 프로젝트가 폐기되고 다른 환경에서 적응하는데 시간이 오래 걸리긴 했지만, 제가 맡은 부분은 확실하게 작동이 된다는 거에 그래도 내가 도움이 되고 실력이 향상되었음을 느꼈습니다. <br>
내가 맡은 부분만 할려하지 않고 자동적으로 다른 부분 파트까지 고치고, 그 결과를 원할하게 수행했다는 점에서 제 성장을 이루었습니다. <br>
아쉬운 점은 원래 하던 프로젝트를 할 시간에 이 프로젝트를 했더라면 더 완벽한 결과물로 제출할 수 있다는 생각이 들었습니다. <br>
또, 소통의 부분에서도 문제가 있었고, 미구현된 부분도 많고, 통일성이 없어 오류가 잦다는 점에서 아쉽다는 생각이 들었습니다. <br>
이번 세미 프로젝트를 통해서 이러한 보완점을 고쳐 다음 파이널 프로젝트에서 더 큰 활약을 보여줄 예정입니다. <br>
그리고 혼자 해야했던 프로젝트를 같이 할 수 있게 도와주신 신선호 팀장님과 안태현 팀원분게 감사함을 느낍니다.
