#!/usr/bin/env bash
# verify-design-tokens.sh
# 후니프린팅 디자인시스템 토큰 검증 스크립트
#
# 사용법:
#   bash .claude/skills/huni-design-system/scripts/verify-design-tokens.sh
#   bash .claude/skills/huni-design-system/scripts/verify-design-tokens.sh --fix-report
#
# 출력: 각 규칙별 위반 파일/라인 목록

set -euo pipefail

QUOTE_DIR="src/components/quote"
UI_DIR="src/components/ui"
ERRORS=0
WARNINGS=0

# ANSI 색상
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RESET='\033[0m'

echo ""
echo "=== Huni Design System Token Verification ==="
echo "Figma source: gEJhQRtmKI66BPhOpqoW3j (option_New)"
echo "Verified: 2026-03-05 via REST API"
echo ""

# ─────────────────────────────────────────────
# RULE-1: native <select> 금지
# ─────────────────────────────────────────────
echo -e "${CYAN}[RULE-1] Checking for native <select> usage...${RESET}"

NATIVE_SELECT=$(grep -rn "<select" "$QUOTE_DIR" "$UI_DIR" 2>/dev/null | grep -v "^\s*//" | grep -v "@MX\|// @MX" || true)
if [ -n "$NATIVE_SELECT" ]; then
  echo -e "${RED}  FAIL: native <select> found (must use HuniCustomSelect):${RESET}"
  echo "$NATIVE_SELECT" | while read -r line; do
    echo "    $line"
  done
  ERRORS=$((ERRORS + 1))
else
  echo -e "${GREEN}  PASS: No native <select> in quote/ui components${RESET}"
fi

# ─────────────────────────────────────────────
# 잘못된 색상 값 검사
# ─────────────────────────────────────────────
echo ""
echo -e "${CYAN}[COLOR] Checking for incorrect color values...${RESET}"

# 구 primary 색상 (#5538b6)
WRONG_PRIMARY=$(grep -rn "5538b6\|5538B6" src/ 2>/dev/null | grep -v ".next\|node_modules\|.git" | grep -v "// @MX\|/\* @MX" || true)
if [ -n "$WRONG_PRIMARY" ]; then
  echo -e "${RED}  FAIL: Wrong primary color #5538b6 found (should be #553886):${RESET}"
  echo "$WRONG_PRIMARY" | while read -r line; do echo "    $line"; done
  ERRORS=$((ERRORS + 1))
else
  echo -e "${GREEN}  PASS: No wrong primary color #5538b6${RESET}"
fi

# 구 dark 색상 (#351D87)
WRONG_DARK=$(grep -rn "351D87\|351d87" src/ 2>/dev/null | grep -v ".next\|node_modules\|.git" | grep -v "// @MX\|/\* @MX" || true)
if [ -n "$WRONG_DARK" ]; then
  echo -e "${RED}  FAIL: Wrong dark color #351D87 found (should be #3B2573):${RESET}"
  echo "$WRONG_DARK" | while read -r line; do echo "    $line"; done
  ERRORS=$((ERRORS + 1))
else
  echo -e "${GREEN}  PASS: No wrong dark color #351D87${RESET}"
fi

# ─────────────────────────────────────────────
# RULE-2: selected state 검사 (colored bg 금지)
# ─────────────────────────────────────────────
echo ""
echo -e "${CYAN}[RULE-2] Checking selected state implementation...${RESET}"

# bg-[#553886] 패턴이 버튼 selected state에 남아있는지 (OrderCTA는 정상)
WRONG_SELECTED=$(grep -n "bg-\[#553886\]" "$QUOTE_DIR/OptionButton.tsx" "$QUOTE_DIR/FinishButton.tsx" 2>/dev/null || true)
if [ -n "$WRONG_SELECTED" ]; then
  echo -e "${RED}  FAIL: Colored background in selected state (should be bg-white + border-2):${RESET}"
  echo "$WRONG_SELECTED" | while read -r line; do echo "    $line"; done
  ERRORS=$((ERRORS + 1))
else
  echo -e "${GREEN}  PASS: OptionButton/FinishButton use correct selected state${RESET}"
fi

# ─────────────────────────────────────────────
# RULE-3: CounterInput 원형 버튼 금지
# ─────────────────────────────────────────────
echo ""
echo -e "${CYAN}[RULE-3] Checking CounterInput button shape...${RESET}"

CIRCULAR_COUNTER=$(grep -n "rounded-full" "$QUOTE_DIR/CounterInput.tsx" 2>/dev/null | grep -v "^[0-9]*:[[:space:]]*//" || true)
if [ -n "$CIRCULAR_COUNTER" ]; then
  echo -e "${RED}  FAIL: CounterInput uses rounded-full (must be rectangular):${RESET}"
  echo "$CIRCULAR_COUNTER" | while read -r line; do echo "    $line"; done
  ERRORS=$((ERRORS + 1))
else
  echo -e "${GREEN}  PASS: CounterInput buttons are rectangular${RESET}"
fi

# ─────────────────────────────────────────────
# RULE-4: ColorChip 50×50px 검사
# ─────────────────────────────────────────────
echo ""
echo -e "${CYAN}[RULE-4] Checking ColorChip dimensions...${RESET}"

SMALL_CHIP=$(grep -n "h-8\|w-8\|h-\[32px\]\|w-\[32px\]" "$QUOTE_DIR/ColorChip.tsx" 2>/dev/null | grep -v "^[0-9]*:[[:space:]]*//" || true)
if [ -n "$SMALL_CHIP" ]; then
  echo -e "${RED}  FAIL: ColorChip uses wrong size (must be 50x50px):${RESET}"
  echo "$SMALL_CHIP" | while read -r line; do echo "    $line"; done
  ERRORS=$((ERRORS + 1))
else
  echo -e "${GREEN}  PASS: ColorChip is 50x50px${RESET}"
fi

# ─────────────────────────────────────────────
# 치수 검증
# ─────────────────────────────────────────────
echo ""
echo -e "${CYAN}[DIM] Checking component dimensions...${RESET}"

check_dimension() {
  local file="$1"
  local expected_class="$2"
  local description="$3"
  if grep -q "$expected_class" "$file" 2>/dev/null; then
    echo -e "${GREEN}  PASS: $description ($expected_class)${RESET}"
  else
    echo -e "${YELLOW}  WARN: $description — expected $expected_class in $file${RESET}"
    WARNINGS=$((WARNINGS + 1))
  fi
}

check_dimension "$QUOTE_DIR/OptionButton.tsx"  "w-\[155px\]"  "OptionButton width 155px"
check_dimension "$QUOTE_DIR/OptionButton.tsx"  "h-\[50px\]"   "OptionButton height 50px"
check_dimension "$QUOTE_DIR/PaperDropdown.tsx" "w-\[348px\]"  "PaperDropdown width 348px"
check_dimension "$QUOTE_DIR/FinishSelect.tsx"  "w-\[461px\]"  "FinishSelect width 461px"
check_dimension "$QUOTE_DIR/OrderCTA.tsx"      "w-\[465px\]"  "OrderCTA width 465px"
check_dimension "$QUOTE_DIR/OrderCTA.tsx"      "rounded-\[5px\]" "OrderCTA radius 5px"
check_dimension "$QUOTE_DIR/FinishButton.tsx"  "w-\[116px\]"  "FinishButton width 116px"
check_dimension "$QUOTE_DIR/CounterInput.tsx"  "w-\[223px\]"  "CounterInput total width 223px"
check_dimension "$QUOTE_DIR/CounterInput.tsx"  "w-\[34px\]"   "CounterInput side button width 34px"
check_dimension "$QUOTE_DIR/ColorChip.tsx"     "w-\[50px\]"   "ColorChip width 50px"
check_dimension "$QUOTE_DIR/ColorChip.tsx"     "h-\[50px\]"   "ColorChip height 50px"

# ─────────────────────────────────────────────
# HuniCustomSelect 공유 컴포넌트 존재 확인
# ─────────────────────────────────────────────
echo ""
echo -e "${CYAN}[SHARED] Checking HuniCustomSelect exists...${RESET}"

if [ -f "$UI_DIR/huni-select.tsx" ]; then
  echo -e "${GREEN}  PASS: src/components/ui/huni-select.tsx exists${RESET}"
else
  echo -e "${RED}  FAIL: src/components/ui/huni-select.tsx missing!${RESET}"
  ERRORS=$((ERRORS + 1))
fi

# ─────────────────────────────────────────────
# Chevron icon 사용 금지 (▼ 텍스트 문자 사용)
# ─────────────────────────────────────────────
echo ""
echo -e "${CYAN}[RULE-1] Checking for ChevronDown icon in dropdowns...${RESET}"

CHEVRON_IN_SELECT=$(grep -n "ChevronDown\|chevron-down" "$QUOTE_DIR/PaperDropdown.tsx" "$QUOTE_DIR/FinishSelect.tsx" "$UI_DIR/huni-select.tsx" 2>/dev/null || true)
if [ -n "$CHEVRON_IN_SELECT" ]; then
  echo -e "${RED}  FAIL: ChevronDown icon in dropdown (must use ▼ text character):${RESET}"
  echo "$CHEVRON_IN_SELECT" | while read -r line; do echo "    $line"; done
  ERRORS=$((ERRORS + 1))
else
  echo -e "${GREEN}  PASS: Dropdowns use ▼ text character, not icon${RESET}"
fi

# ─────────────────────────────────────────────
# 결과 요약
# ─────────────────────────────────────────────
echo ""
echo "============================================"
if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
  echo -e "${GREEN}ALL CHECKS PASSED — Design system tokens verified${RESET}"
elif [ $ERRORS -eq 0 ]; then
  echo -e "${YELLOW}PASSED with $WARNINGS warning(s)${RESET}"
else
  echo -e "${RED}FAILED: $ERRORS error(s), $WARNINGS warning(s)${RESET}"
  echo ""
  echo "Fix reference: .claude/skills/huni-design-system/SKILL.md"
  echo "Token reference: .claude/skills/huni-design-system/references/tailwind-tokens.md"
  exit 1
fi
echo ""
