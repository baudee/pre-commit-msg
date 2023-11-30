#!/bin/bash
REPO_ROOT=$(git rev-parse --show-toplevel)
cd "$REPO_ROOT"/unique_server

ALLOWED_TYPES=("feat" "fix" "build" "chore" "ci" "docs" "perf" "refactor" "revert" "style" "test")

RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

COMMIT_MSG=$(head -n1 "$REPO_ROOT/.git/COMMIT_EDITMSG")

containsElement () {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

COMMIT_TYPE=$(echo $COMMIT_MSG | cut -d':' -f1)

if containsElement "$COMMIT_TYPE" "${ALLOWED_TYPES[@]}"; then
  exit 0
else
  echo -e "${RED}[Incorrect Commit Message Format] >>${NC} ${COMMIT_MSG}"
  echo -e "${YELLOW}This commit message doesn't adhere to the Conventional Commits standard."
  echo -e "${BLUE}https://www.conventionalcommits.org/${YELLOW}\n"
  echo -e "Conventional Commits should begin with any of the following types, followed by a colon,"
  echo -e "then the subject of the commit and, optionally, a detailed body separated by a newline:${NC}"
  echo -e "    ${ALLOWED_TYPES[*]}"
  echo -e "\n${YELLOW}Sample commit message for a new feature:${NC}"
  echo -e "    feat: add search functionality"
  echo -e "\n${YELLOW}Sample commit message for a bug fix:${NC}"
  echo -e "    fix: correct user login error"
  echo -e "\n${YELLOW}Sample commit specifying a scope within brackets following the type for additional clarity:${NC}"
  echo -e "    fix(auth): correct token expiration issue"
  echo -e "\n${YELLOW}Sample commit including a descriptive body:${NC}"
  echo -e "    fix: resolve data loading failure"
  echo -e "    This commit addresses the issue where data was not properly loading on the dashboard\n"
  exit 1
fi
