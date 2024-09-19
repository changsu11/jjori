# team-legolego
한정교 first project 
## ✈ 배포주소

개발 버전 : version 1.0.0.0 </br>
도메인 주소 : www.lezzanggo.shop </br>

## ✌️버전
| Version | Description | Date |
| --- | --- | --- |
| 0.1.1 | - Frontend 서버 구축 | 2024.07.15 |
| 0.1.2 | - Backend 서버 구축 | 2024.08.16 |
| 1.0.0 | - 서버 연동 완료 | 2024.08.18 |



## 🧑‍💻팀원 소개

| 이름 | 이창수 | 박현우 |
| :------------: | :------------: | :------------: |
|  | <img src="https://avatars.githubusercontent.com/u/174182609?v=4" width="150" /> | <img src="https://avatars.githubusercontent.com/u/154039941?v=4" width="150" /> |
| 깃허브 | [@ikmet147@naver.com] | [@hyeeonwoo](https://github.com/hyeeonwoo) |
| 역할 | Project Leader | Technology Leader|
|  |  |  |  |

| 이름 | 최효은 | 김태형 |
| :------------: | :------------: | :------------: |
|  | <img src="https://avatars.githubusercontent.com/u/96418737?v=4" width="150" />| <img src="https://avatars.githubusercontent.com/u/174774514?v=4" width="150" /> |
| 깃허브 | [@hyoeun96] | |
| 역할 | Engineer | Engineer |



## 📌 프로젝트 소개

이 프로젝트는 Kubernetes를 사용하여 3-Tier 웹 서비스 아키텍처를 구축한 사례로, LEGO 상품 홈페이지를 개발하고 이를 컨테이너화하여 웹 서버, 애플리케이션 서버, 데이터베이스 간 통신을 구성합니다. 본 README는 주요 기술 스택, 시스템 아키텍처, 트래픽 및 부하 처리 방법, 그리고 배포 전략 등을 설명합니다.

### 프로젝트 시나리오

저희는 전 세계적으로 인기 있는 레고 제품을 판매하는 웹사이트를 운영하고 있습니다. 
최근 들어 레고 팬들이 폭발적으로 늘어나면서 사이트의 트래픽이 급증했고, 이를 효과적으로 처리하면서도 지속적으로 상품 페이지를 업데이트해야 하는 상황이 되었습니다.
이러한 문제를 해결하기 위해 저희는 Nginx, Tomcat, MariaDB를 활용하여 3-Tier 구조로 시스템을 구성했습니다.

희는 메인 페이지에서 새로운 레고 제품의 가격 변동과 상품 설정을 변경했습니다. 
업데이트가 완료된 후, 모든 클라이언트는 최신 상품 정보를 확인할 수 있었습니다. 이를 통해 사이트의 높은 트래픽을 효과적으로 처리하면서도 항상 최신 정보를 제공할 수 있었습니다.

저희 레고 판매 사이트는 이러한 시스템 구성과 운영 방식을 통해 안정적인 서비스를 제공하며, 지속적으로 성장하고 있습니다. 
고객들은 언제나 최신 레고 제품을 편리하게 구매할 수 있고, 저희는 높은 트래픽 속에서도 안정적인 서비스를 유지할 수 있었습니다.


## 🛠기술 스택

<table>
<tr>
 <td align="center">언어</td>
 <td>
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=ffffff"/>
  <img src="https://img.shields.io/badge/Java-orange?style=for-the-badge&logo=Java&logoColor=white"/>
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 	 
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"/>
 </td>
</tr>
	
<tr>
 <td align="center">프레임워크</td>
 <td>
  <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=ffffff"/> 
</tr>

<tr>
 <td align="center">인프라</td>
 <td>
  <img src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white"/>
  <img src="https://img.shields.io/badge/tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black">
	<img src="https://img.shields.io/badge/nginx-009639?style=for-the-badge&logo=nginx&logoColor=white">
  <img src="https://img.shields.io/badge/docker-2496ED?style=for-the-badge&logo=docker&logoColor=ffffff"/>
  <img src="https://img.shields.io/badge/linux-FCC624?style=for-the-badge&logo=linux&logoColor=black">
  <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
  <img src="https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white"/>
  
  
<tr>
 <td align="center">협업툴</td>
 <td>
    <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"/>
    <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"/>

   
 </td>
</tr>
<tr>
 <td align="center">기타</td>
 <td>
    <img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white"/> 
</tr>
</table>

## 🧱아키텍처



![전체아키텍처구성(4조)최종 drawio](https://github.com/user-attachments/assets/5195d5d6-51ec-4fe6-8162-9b7909f18c7a)



## 🗂PAGE
--PAGE

![스크린샷_18-9-2024_143146_](https://github.com/user-attachments/assets/a1e330a7-1a17-4959-8c82-5d9cb770fbe0)

![스크린샷_18-9-2024_14325_](https://github.com/user-attachments/assets/e4a32e40-8603-4926-94e9-e9a784b4c605)

![스크린샷_18-9-2024_143157_](https://github.com/user-attachments/assets/469ccecf-5259-41cb-81e6-0ad69810c71e)

