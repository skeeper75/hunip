# Huni Design System — Tailwind Token Mappings

Figma REST API 검증 토큰 → Tailwind CSS 클래스 완전 매핑표.
모든 새 컴포넌트 작성 시 이 파일을 참조할 것.

Source: Figma file `gEJhQRtmKI66BPhOpqoW3j`, OVERVIEW node `1661:132`
Config: `tailwind.config.ts` `huni-*` 네임스페이스

---

## Color Tokens

| Figma Token | Hex | Tailwind Class (text) | Tailwind Class (bg) | Tailwind Class (border) |
|---|---|---|---|---|
| primary | `#553886` | `text-huni-primary` | `bg-huni-primary` | `border-huni-primary` |
| primary-dark | `#3B2573` | `text-huni-primary-dark` | `bg-huni-primary-dark` | `border-huni-primary-dark` |
| border-default | `#CACACA` | — | — | `border-huni-border` |
| text-label | `#424242` | `text-huni-label` | — | — |
| text-muted | `#979797` | `text-huni-muted` | — | — |
| text-body | `#616161` | `text-huni-body` | — | — |
| text-dark | `#1E1E1E` | `text-huni-dark` | — | — |
| bg-section | `#F5F5F5` | — | `bg-huni-section` | — |
| divider | `#E8E8E8` | — | `bg-huni-divider` | `border-huni-divider` |
| badge-highlight | `#FF66CC` | `text-white` | `bg-huni-badge` | — |

### 하드코딩 클래스 (huni 네임스페이스 없는 경우)

일부 컴포넌트는 아직 huni-* 네임스페이스 대신 직접 hex 사용 — 양쪽 모두 허용:

```tsx
// 둘 다 올바름
className="text-huni-primary"
className="text-[#553886]"

// huni 네임스페이스 사용 권장 (변경 용이)
```

---

## Dimension Tokens

### 버튼 / 컴포넌트 높이

| Figma Spec | Tailwind Class | 적용 컴포넌트 |
|---|---|---|
| 50px (standard height) | `h-[50px]` | OptionButton, CounterInput, PaperDropdown, FinishButton, ColorChip, FinishSelect, OrderCTA |
| 40px (label height) | `h-[40px]` | Section labels |
| 14px (badge height) | `h-[14px]` | 추천 badge |

### 컴포넌트 너비

| Figma Spec | Tailwind Class | 적용 컴포넌트 |
|---|---|---|
| 155px | `w-[155px]` | OptionButton |
| 116px | `w-[116px]` | FinishButton |
| 223px | `w-[223px]` | CounterInput (전체) |
| 34px | `w-[34px]` | CounterInput 사이드 버튼 |
| 348px | `w-[348px]` | PaperDropdown |
| 461px | `w-[461px]` | FinishSelect |
| 465px | `w-[465px]` | OrderCTA 버튼 |
| 140px | `w-[140px]` | FinishInput |
| 50px | `w-[50px]` | ColorChip |

---

## Border Radius

| Figma Spec | Tailwind Class | 적용 컴포넌트 |
|---|---|---|
| 4px (standard) | `rounded-[4px]` | OptionButton, CounterInput, PaperDropdown, FinishButton, FinishSelect, FinishInput, ColorChip (사각) |
| 5px (CTA) | `rounded-[5px]` | OrderCTA 버튼 |
| 50% (ellipse) | `rounded-full` | ColorChip (원형) |

---

## Typography

| Figma Role | Tailwind Classes |
|---|---|
| Section label (16px/500/#424242) | `text-base font-medium text-huni-label` |
| Button default (14px/400/#979797) | `text-sm font-normal text-huni-muted` |
| Button selected (14px/400/#553886) | `text-sm font-normal text-huni-primary` |
| Dropdown text (14px/400/#424242) | `text-sm font-normal text-huni-label` |
| Counter value (14px/500/#979797) | `text-sm font-medium text-huni-muted` |
| FinishBar title (13px/600/#424242) | `text-[13px] font-semibold text-huni-label` |
| FinishBar action (12px/400/#553886) | `text-xs font-normal text-huni-primary` |
| FinishButton default (12px/400/#979797) | `text-xs font-normal text-huni-muted` |
| FinishButton selected (12px/600/#553886) | `text-xs font-semibold text-huni-primary` |
| Help text (11px/400/#979797) | `text-[11px] font-normal text-huni-muted` |
| Summary item (12px/400/#616161) | `text-xs font-normal text-huni-body` |
| Total amount (24px/600/#553886) | `text-2xl font-semibold text-huni-primary` |
| CTA button (14px/600) | `text-sm font-semibold` |

> **[CRITICAL]** 폰트는 반드시 Noto Sans. `font-[Noto_Sans]` 또는 CSS variable `--font-noto-sans` 사용.

---

## Selected State Pattern (RULE-2)

```tsx
// CORRECT: white bg + colored border
const selectedClass = "bg-white border-2 border-[#553886] text-[#553886]";
const defaultClass  = "bg-white border border-[#CACACA] text-[#979797]";

// WRONG: colored background
const wrongClass = "bg-[#553886] text-white"; // ❌ FORBIDDEN
```

---

## Component Quick-Reference Classes

### OptionButton

```tsx
// 기본
"w-[155px] h-[50px] rounded-[4px] bg-white border border-[#CACACA] text-sm font-normal text-[#979797]"
// 선택됨
"w-[155px] h-[50px] rounded-[4px] bg-white border-2 border-[#553886] text-sm font-normal text-[#553886]"
```

### PaperDropdown / FinishSelect (HuniCustomSelect)

```tsx
// 트리거 div
"relative flex items-center h-[50px] w-full border border-[#CACACA] rounded-[4px] bg-white cursor-pointer select-none"
// 열린 상태 테두리
"border-[#553886]"
// 캐럿 ▼
"absolute right-4 top-1/2 -translate-y-1/2 text-xs text-[#979797] pointer-events-none"
// 드롭다운 목록
"absolute top-full left-0 right-0 z-50 border border-[#CACACA] bg-white rounded-b-[4px] shadow-lg max-h-60 overflow-y-auto"
// 선택된 항목
"text-[#553886] font-medium bg-[#F5F5F5]"
```

### CounterInput

```tsx
// 컨테이너
"flex items-stretch w-[223px] h-[50px] border border-[#CACACA] rounded-[4px] bg-white overflow-hidden"
// 사이드 버튼 (좌/우 동일)
"flex items-center justify-center w-[34px] h-full text-lg text-[#424242] hover:bg-[#F5F5F5]"
// 중앙 값 영역
"flex-1 flex items-center justify-center text-sm font-medium text-[#979797]"
```

### ColorChip

```tsx
// 기본
"w-[50px] h-[50px] rounded-full cursor-pointer"
// 선택됨 (white fill + #553886 ring)
"w-[50px] h-[50px] rounded-full bg-white ring-2 ring-[#553886] ring-offset-0"
```

### OrderCTA

```tsx
// PDF 업로드 (outline)
"w-[465px] h-[50px] rounded-[5px] bg-white border border-[#553886] text-sm font-semibold text-[#424242]"
// 디자인 에디터 (filled)
"w-[465px] h-[50px] rounded-[5px] bg-[#553886] border border-[#553886] text-sm font-semibold text-white"
// 장바구니 (dark)
"w-[465px] h-[50px] rounded-[5px] bg-[#3B2573] text-sm font-semibold text-white"
```

---

Version: 2.0.0 | Updated: 2026-03-05
