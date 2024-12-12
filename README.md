# MyTemplates
이후에 사용할만한 기술(template)을 담은 깃을 git subtree 로 관리하는 템플릿 모음(templates) 프로젝트

## 프로젝트 구조

```
root/
├── README.md
├── scripts/
│   └── update-all-subtrees.sh
├── ApiDesign
└── java-spring-jpa-security
```
<br><br>

## 서브트리 모듈 목록
현재 프로젝트에 포함된 서브트리 모듈들입니다:

### ApiDesign
- **저장소**: `https://github.com/SongHae8640/ApiDesign.git`
- **설명**: API 설계를 위한 유스케이스 작성, REST API 설계

### java-spring-jpa-security
- **저장소**: `https://github.com/SongHae8640/java-spring-jpa-security.git`
- **설명**: Spring Security를 이용한 기본적인 회원가입, 인증/인가, 게시글 관리, 공통 예외처리 초기 구조 세팅
<br><br><br><br>


## 새로운 서브트리 추가하기

새로운 서브트리를 추가하려면 다음 명령어를 사용합니다:

```bash
# 서브트리 추가
git subtree add --prefix=[로컬_경로] [원격_저장소_URL] [브랜치]

# 예시
git subtree add --prefix=module-d https://github.com/username/module-d.git main
```
<br><br>

## 서브트리 업데이트

특정 서브트리의 변경사항을 가져오려면:

```bash
# 변경사항 가져오기
git subtree pull --prefix=[로컬_경로] [원격_저장소_URL] [브랜치]
git push

# 예시
git subtree pull --prefix=module-a https://github.com/username/module-a.git main
git push
```
<br><br>

## 전체 서브트리 업데이트

모든 서브트리를 한 번에 업데이트하려면 제공된 스크립트를 사용합니다:

```bash
# 스크립트 실행 권한 부여
chmod +x scripts/update-all-subtrees.sh

# 스크립트 실행
./scripts/update-all-subtrees.sh
```
