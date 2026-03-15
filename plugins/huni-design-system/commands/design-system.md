---
name: design-system
description: "후니프린팅 디자인 시스템 가이드. 14개 컴포넌트 카탈로그, 11개 상품 섹션, 디자인 토큰, Figma 스펙 조회."
argument-hint: "[컴포넌트명 또는 질문] (예: OptionButton, ColorChip 스펙, 디지털인쇄 섹션)"
allowed-tools: Read, Grep, Glob, Bash
model: sonnet
skills:
  - innojini-huni-design-system
---

# /design-system 명령어

후니프린팅 디자인 시스템 가이드를 제공합니다.

## 사용법

인자가 없는 경우 아래 가이드를 표시하고, 인자가 있는 경우 해당 컴포넌트 또는 섹션에 대한 스펙을 조회합니다.

$ARGUMENTS 값을 확인하세요.

## 인자가 없는 경우

아래 컴포넌트 카탈로그와 상품 섹션 목록을 표시합니다:

```
후니프린팅 디자인 시스템 (Huni Design System v5.0.0)

사용법: /design-system [컴포넌트명 또는 질문]

컴포넌트 카탈로그 (14개):
  1. ButtonType          - 155x50px 옵션 버튼 (RULE-2)
  2. SelectBoxType       - 커스텀 드롭다운 (RULE-1: native select 금지)
  3. CounterInputType    - 3-part 수량 입력 (RULE-3)
  4. ColorChipType       - 50x50px 원형 색상 칩 (RULE-4)
  5. PriceSliderType     - Radix 슬라이더 (RULE-5-EXT)
  6. ImageChipType       - 50x50px 원형 이미지 칩 (RULE-6-EXT)
  7. MiniColorChipType   - 32x32px 원형 색상 칩 (RULE-7-EXT)
  8. LargeColorChipType  - 50x50px 그리드 색상 칩 (RULE-8-EXT)
  9. AreaInputType       - 가로x세로 mm 입력
  10. PageCounterInputType - 페이지수 입력
  11. FinishButtonType    - 116x50px 후가공 버튼 (RULE-2)
  12. FinishSelectBoxType - 후가공 드롭다운 (RULE-1)
  13. SummaryType         - 가격 요약
  14. UploadType          - 파일 업로드 CTA

상품 섹션 (11개):
  01. 디지털인쇄    06. 디자인캘린더
  02. 책자         07. 악세사리
  03. 스티커       08. 아크릴
  04. 포토북       09. 실사/배너
  05. 캘린더       10. 문구
                  11. 굿즈/파우치

디자인 토큰:
  - Primary: #5538B6 (Purple)
  - Dark: #351D87
  - Font: Noto Sans (400/500/600)
  - Border: #CACACA
  - Selected: white + #553886 border-2

예시:
  /design-system OptionButton
  /design-system ColorChip 스펙
  /design-system 디지털인쇄 섹션
  /design-system typography
  /design-system RULE-1
```

## 인자가 있는 경우

`$ARGUMENTS`의 내용을 분석하여 innojini-huni-design-system 스킬을 활용해 정보를 제공합니다.

처리 순서:
1. 질문 유형 판별 (컴포넌트/섹션/토큰/규칙 중 해당 분야)
2. 관련 참조 파일 로드 (components.md, product-sections/, references/)
3. Figma 스펙 기반 정확한 치수, 색상, 상태값 제공
4. Critical Rules(RULE-1~8) 관련 주의사항 안내
5. 구현 예시 코드 제공 (cva + Radix 패턴)
