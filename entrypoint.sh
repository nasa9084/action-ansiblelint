#!/bin/sh

cd "$GITHUB_WORKSPACE" || exit 

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

ansible-lint --version
ansible-lint -p 

ansible-lint -p \
  | reviewdog -efm="%f:%l:%c: %m" \
      -name="ansible-lint" \
      -reporter="${INPUT_REPORTER:-github-pr-check}" \
      -level="${INPUT_LEVEL}" 
