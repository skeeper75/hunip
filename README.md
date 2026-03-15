# hunip - 후니프린팅 Claude Code 플러그인 마켓플레이스

인쇄 산업 특화 Claude Code 플러그인 모음. 정책 자문, 인쇄 기초 계산, 디자인 시스템 가이드를 제공합니다.

## 설치

### 마켓플레이스 전체 설치

```bash
/plugin marketplace add skeeper75/hunip
```

### 개별 플러그인 설치

```bash
# shopby 정책 자문
/plugin install skeeper75/hunip --path plugins/shopby-policy

# 인쇄 기초 계산
/plugin install skeeper75/hunip --path plugins/printing-foundation

# 후니 디자인 시스템
/plugin install skeeper75/hunip --path plugins/huni-design-system
```

---

## 플러그인 목록

### 1. shopby-policy

shopby Enterprise 기반 인쇄 사이트 정책 자문 플러그인.

**기능:**
- 13개 정책 도메인 자문 (회원, 상품, 주문, 결제, 배송, 취소/반품, CS, 마케팅, B2B, 관리, 거래처, 회계, 통계)
- 95개 IA 기능 분류 (NATIVE 40% / SKIN 28% / CUSTOM 31% / EXTERNAL 2%)
- 한국 인쇄업계 벤치마크 제공
- 정책 결정 체크리스트 및 추천 정책안

**슬래시 명령어:**
```
/policy                           # 정책 도메인 목록
/policy 배송정책                    # 배송 정책 자문
/policy B2B 후불결제               # 특정 기능 자문
```

**포함 컴포넌트:**
- 에이전트: `expert-printing-policy`
- 스킬: `innojini-shopby-policy-advisor`
- 참조: `feature-mapping.md`, `industry-benchmarks.md`, `shopby-capability-matrix.md`
- 템플릿: `policy-document.md`

---

### 2. printing-foundation

인쇄 산업 공통 기술 지식 베이스.

**기능:**
- 조판(Imposition) 계산: UP수, 판걸이, 자투리 배치, 조판 효율
- CTP 판수 계산: 인쇄 방식별 비교 (Sheetwise, Work&Turn)
- 접지(Folding) 배열: 십자접지 16P, 롤접지, 대지 크기
- 책등/오시(Spine) 계산: 두께, 오시 줄 수, 표지 펼침 크기
- 크립(Creep) 보정: 중철제본 크립량 계산
- 용지 규격: 전지(국전, 46전), 롤(디지털), 용지 두께 DB

**슬래시 명령어:**
```
/printing                          # 계산 도구 목록
/printing 조판 A4 국전              # 조판 계산
/printing CTP 100페이지 4도양면      # CTP 판수 계산
/printing 책등 200페이지 모조 80g    # 책등 두께 계산
/printing 크립 48페이지 중철         # 크립 보정량 계산
```

**포함 스크립트:**
- `imposition_calc.py` - 조판 계산
- `ctp_calc.py` - CTP 판수 계산
- `spine_calc.py` - 책등/오시/크립 계산

**포함 데이터:**
- `paper-formats.json` - 용지 규격 DB
- `paper-thickness.json` - 용지 두께 DB

---

### 3. huni-design-system

후니프린팅 상품 옵션 UI 디자인 시스템 (Figma REST API 검증 완료).

**기능:**
- 14개 componentType 카탈로그 (ButtonType, SelectBoxType, CounterInputType 등)
- 11개 상품 섹션 상세 스펙 (디지털인쇄, 책자, 스티커, 포토북, 캘린더 등)
- 디자인 토큰: Color Palette, Typography, Spacing
- Critical Rules (RULE-1 ~ RULE-8-EXT): native select 금지, 선택 상태, 치수 규격
- 4-Zone 레이아웃 분석
- shadcn/ui + Radix + cva 아키텍처 패턴

**슬래시 명령어:**
```
/design-system                     # 컴포넌트 카탈로그
/design-system OptionButton        # 컴포넌트 스펙 조회
/design-system 디지털인쇄 섹션       # 상품 섹션 스펙
/design-system RULE-1              # Critical Rule 확인
/design-system typography          # 타이포그래피 토큰
```

**주요 디자인 토큰:**

| 토큰 | 값 | 용도 |
|------|-----|------|
| primary | #5538B6 | 선택 상태, CTA |
| primary-dark | #351D87 | 다크 CTA |
| text-dark | #424242 | 기본 텍스트 |
| text-muted | #979797 | 비선택 텍스트 |
| border-default | #CACACA | 기본 테두리 |
| font | Noto Sans | 400/500/600 |

---

## 라이선스

MIT License - Copyright (c) 2026 innojini

## 저자

- **innojini** - skeeper75@gmail.com
- GitHub: [skeeper75](https://github.com/skeeper75)
