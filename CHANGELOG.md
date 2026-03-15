# Changelog

이 프로젝트의 모든 주요 변경 사항을 기록합니다.
[Keep a Changelog](https://keepachangelog.com/ko/1.0.0/) 형식을 따릅니다.

## [1.1.0] - 2026-03-15

### Added
- 주문 프로세스 참조 문서 (`references/order-process.md`)
  - MES 기반 주문 상태 흐름
  - 자동알림 11종 (이메일/알림톡/문자)
  - 인쇄타입별 접수파일 속성
  - 조직별 업무 및 권한관리
  - 클레임처리 프로세스
  - 발주업무 프로세스
- 공정 플로우 참조 문서 (`references/production-flow.md`)
  - 17개 제작 Case 공정 흐름
  - 공정 상태 트래킹 포인트
  - 공정별 현황 대시보드
- 파일 프로세싱 참조 문서 (`references/file-processing.md`)
  - Printly 인쇄 파일처리 자동화 시스템 명세
  - PDF 검증·변환·최적화 파이프라인
  - AS-IS(CRT DigitalEdit V2) → TO-BE(클라우드 SaaS) 전환 설계
- 13개 정책 도메인 문서 (`policies/`)
  - 회원/인증, 마이페이지, 고객서비스, 결제, 주문, 정보/가이드
  - 마케팅, 상품/옵션/가격, 관리자, 거래처, 회계, 통계
  - 경쟁사 비교 (레드프린팅/와우프레스/오프린트미)
  - Mermaid UserFlow 다이어그램
  - 정책 결정 체크리스트

## [1.0.0] - 2026-03-15

### 추가
- **hunip 마켓플레이스** 초기 릴리스
- **shopby-policy** 플러그인: shopby Enterprise 정책 자문 (13개 도메인, 95개 IA)
  - `/policy` 슬래시 명령어
  - `expert-printing-policy` 에이전트
  - `innojini-shopby-policy-advisor` 스킬
  - 참조: feature-mapping, industry-benchmarks, shopby-capability-matrix
  - 템플릿: policy-document
- **printing-foundation** 플러그인: 인쇄 산업 기초 지식 베이스
  - `/printing` 슬래시 명령어
  - `innojini-printing-foundation` 스킬
  - 계산 스크립트: imposition_calc, ctp_calc, spine_calc
  - 데이터: paper-formats, paper-thickness
  - 참조: page-layouts, nesting-algorithms
- **huni-design-system** 플러그인: 후니프린팅 디자인 시스템 v5.0.0
  - `/design-system` 슬래시 명령어
  - `innojini-huni-design-system` 스킬
  - 14개 componentType 카탈로그
  - 11개 상품 섹션 스펙
  - 디자인 토큰, Critical Rules (RULE-1 ~ RULE-8-EXT)
  - 참조: tailwind-tokens, figma-api, cva-patterns, radix-integration, component-composition
  - 검증 스크립트: verify-design-tokens.sh
