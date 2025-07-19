# BulletinBoard 🧑‍💻👩‍💻

---

## 프로젝트 소개

우리 팀 게시판은 팀원 간의 원활한 소통과 정보 공유를 위해 개발되는 웹 기반 게시판 서비스입니다. 해커톤 참여 전 개발 역량 강화를 목표로, 프런트엔드와 백엔드를 분리하여 풀스택 개발 경험을 쌓는 사이드 프로젝트입니다. 🚀

## 주요 기능 ✨

* **게시글 작성/조회/수정/삭제**: 기본적인 CRUD(Create, Read, Update, Delete) 기능
* **댓글 작성/조회/삭제**: 게시글에 대한 댓글 기능
* **사용자 인증 및 권한 관리**: 로그인/회원가입, 사용자별 게시글 및 댓글 관리 권한
* **검색 기능**: 게시글 제목 또는 내용으로 검색
* **페이지네이션**: 게시글 목록 페이지네이션 처리

## 기술 스택 🛠️

### 🚀 Front-end

* **React (with App Router)**: 사용자 인터페이스 구축을 위한 JavaScript 라이브러리 및 최신 라우팅 방식
* **TypeScript**: 정적 타입 체크를 통한 코드 안정성 확보
* **Tailwind CSS**: 유틸리티 우선 CSS 프레임워크를 활용한 빠른 스타일링
* **Vite**: 빠르고 경량화된 프런트엔드 빌드 도구

### ⚙️ Back-end

* **FastAPI**: Python 기반의 고성능 웹 프레임워크
* **Python**: 백엔드 로직 구현
* **SQLAlchemy**: ORM(Object Relational Mapping)
* **PostgreSQL**: 관계형 데이터베이스

## 개발 환경 설정 🖥️

프로젝트를 로컬에서 실행하기 위한 설정 방법입니다. 본 프로젝트는 **Linux 환경**을 가정하고 있습니다.

### 📋 사전 준비

* Node.js (LTS 버전 권장) 설치
* Python (3.9+ 권장) 설치
* Git 설치
* PostgreSQL 설치 및 설정
* uv (Python 패키지 관리 도구) 설치:
    ```bash
    pip install uv
    ```

### 🚀 클론 및 설치

```bash
# 레포지토리 클론
git clone [레포지토리 주소]
cd [프로젝트 폴더명]

# 프런트엔드 의존성 설치
cd frontend
npm install
cd ..

# 백엔드 가상 환경 생성 및 의존성 설치 (uv 사용)
cd backend
uv venv
source .venv/bin/activate
uv pip install -r requirements.txt
cd ..
```

## 프로젝트 실행 🏃‍♀️
🧑‍💻 개발 모드
프런트엔드와 백엔드 서버를 동시에 실행합니다.

> 💡 팁: Ctrl+Shift+B 이후 '전체 실행 - 개발 모드'를 사용하면 두 서버를 모두 편리하게 이용할 수 있습니다.