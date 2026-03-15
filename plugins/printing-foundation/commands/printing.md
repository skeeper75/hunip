---
name: printing
description: "인쇄 산업 기초 계산 도구. 조판, CTP 판수, 접지, 책등/오시, 크립 보정, 용지 규격 조회를 제공합니다."
argument-hint: "[계산 유형 또는 질문] (예: 조판 A4, CTP 100페이지, 책등 200페이지 80g)"
allowed-tools: Read, Grep, Glob, Bash
model: sonnet
skills:
  - innojini-printing-foundation
---

# /printing 명령어

인쇄 산업 기초 계산 도구를 제공합니다.

## 사용법

인자가 없는 경우 아래 가이드를 표시하고, 인자가 있는 경우 해당 계산 또는 조회를 수행합니다.

$ARGUMENTS 값을 확인하세요.

## 인자가 없는 경우

아래 계산 도구 목록과 사용 가이드를 표시합니다:

```
인쇄 기초 계산 도구 (Printing Foundation)

사용법: /printing [계산 유형 또는 질문]

계산 도구:
  1. 조판 (Imposition)  - UP수, 판걸이, 자투리 배치, 조판 효율
  2. CTP 판수           - CTP 판수 계산, 인쇄 방식별 비교
  3. 접지 (Folding)     - 십자접지, 3단접지, 페이지 배열, 대지
  4. 책등/오시 (Spine)   - 책등 두께, 오시 줄 수, 표지 펼침 크기
  5. 크립 (Creep)       - 중철 크립 보정량 계산
  6. 용지 규격 (Paper)   - 전지 규격, 롤 규격, 용지 두께

예시:
  /printing 조판 A4 국전
  /printing CTP 100페이지 4도양면 무선
  /printing 책등 200페이지 모조 80g
  /printing 크립 48페이지 중철
  /printing 용지규격 국전

스크립트 직접 실행:
  /printing 조판 계산 --width 210 --height 297 --bleed 3
  /printing CTP 계산 --pages 100 --signature 16 --colors 4
  /printing 책등 계산 --pages 200 --paper 80g --binding 무선
```

## 인자가 있는 경우

`$ARGUMENTS`의 내용을 분석하여 innojini-printing-foundation 스킬을 활용해 계산 또는 조회를 수행합니다.

처리 순서:
1. 질문 유형 판별 (조판/CTP/접지/책등/크립/용지 중 해당 분야)
2. 필요한 파라미터 추출 (크기, 페이지수, 용지, 제본방식 등)
3. 해당 계산 스크립트 실행 또는 참조 데이터 조회
4. 결과를 표 형식으로 정리하여 출력
5. 관련 팁이나 주의사항 안내
