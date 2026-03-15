# Changelog

이 프로젝트의 모든 주요 변경 사항을 기록합니다.
[Keep a Changelog](https://keepachangelog.com/ko/1.0.0/) 형식을 따릅니다.

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
