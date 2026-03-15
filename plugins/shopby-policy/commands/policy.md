---
name: policy
description: "shopby Enterprise 기반 인쇄 사이트 정책 자문. 13개 정책 도메인에 대한 기능 분류, 업계 벤치마크, 정책 결정 가이드를 제공합니다."
argument-hint: "[정책 질문 또는 도메인명] (예: 배송정책, 결제방법, B2B 후불결제)"
allowed-tools: Read, Grep, Glob, WebSearch, WebFetch
model: sonnet
skills:
  - innojini-shopby-policy-advisor
---

# /policy 명령어

shopby Enterprise 기반 후니프린팅 사이트의 정책 자문을 제공합니다.

## 사용법

인자가 없는 경우 아래 가이드를 표시하고, 인자가 있는 경우 해당 정책 도메인에 대한 자문을 시작합니다.

$ARGUMENTS 값을 확인하세요.

## 인자가 없는 경우

아래 13개 정책 도메인 목록과 사용 가이드를 표시합니다:

```
shopby Enterprise 정책 자문 시스템

사용법: /policy [질문 또는 도메인명]

13개 정책 도메인:
  1. 회원정책        - 가입, 로그인, 등급, B2B 회원
  2. 상품/옵션정책    - 인쇄 옵션, 가격 매트릭스, 카테고리
  3. 주문 워크플로우   - 파일 업로드, 장바구니, 결제, 주문완료
  4. 결제정책        - PG, 프린팅머니, 후불결제
  5. 배송정책        - 배송방법, 배송비, 납기일
  6. 취소/반품정책    - 맞춤 제작 상품 규정
  7. 고객서비스정책    - 문의 유형, SLA, 채널
  8. 마케팅정책      - 쿠폰, 리뷰, 체험단
  9. B2B 기업정책    - 법인고객, 대량주문
  10. 관리/운영정책   - 역할, 권한
  11. 거래처정책      - 거래처 관리, 오프라인 B2B
  12. 회계정책       - 원장, 미수금
  13. 통계/리포트정책  - 매출, 생산, 팀별 통계

예시:
  /policy 배송정책
  /policy B2B 후불결제는 shopby에서 지원하나요?
  /policy 인쇄 옵션 구조를 어떻게 설계해야 하나요?

기능 분류 체계:
  NATIVE   - shopby 기본 제공 (40%, 38개)
  SKIN     - 스킨 커스텀 필요 (28%, 26개)
  CUSTOM   - 커스텀 개발 필요 (31%, 29개)
  EXTERNAL - 외부 서비스 연동 (2%, 2개)
```

## 인자가 있는 경우

`$ARGUMENTS`의 내용을 분석하여 innojini-shopby-policy-advisor 스킬을 활용해 정책 자문을 제공합니다.

자문 순서:
1. 질문이 관련된 정책 도메인 식별
2. feature-mapping.md에서 관련 기능 조회
3. 각 기능을 NATIVE/SKIN/CUSTOM/EXTERNAL로 분류
4. shopby 네이티브 지원 사항, 커스텀 개발 필요 사항, 업계 벤치마크 제공
5. 정책 결정 체크리스트와 추천 정책안 제시
