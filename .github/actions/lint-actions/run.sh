echo "::add-matcher::${{ github.action_path }}/actionlint-matcher.json"

actionlint -color -verbose

npx v8r@0.13.0 ".github/**/*" --ignore-errors