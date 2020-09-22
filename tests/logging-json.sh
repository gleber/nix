source common.sh

clearStore

mkdir -p $TEST_ROOT/tmp

# nix-build -vvvv simple.deps.nix --no-out-link  --log-format internal-json 2>&1 | ts '%.s'
# exit 1

# nix-build multiple-outputs.nix -A a.all -o $TEST_ROOT/result
nix-build -vvv simple.deps.nix --no-out-link --log-format internal-json 2>&1 | ts '%.s' | tee /tmp/nix-kha-json.log
# nix-build -vvvvvvv simple.deps.nix --no-out-link 2>&1

# echo $TEST_ROOT
# ls -la $TEST_ROOT/tmp

# cat $TEST_ROOT/tmp/json.log
# cat $TEST_ROOT/tmp/json.log | kha/nix-jsonlog-to-kha.py - $KHA_PGURI | tee /tmp/kha.dot

exit 1

# Test nix-store -l.
[ "$(nix-store -l $path)" = FOO ]

# Test compressed logs.
clearStore
rm -rf $NIX_LOG_DIR
(! nix-store -l $path)
nix-build dependencies.nix --no-out-link --compress-build-log
[ "$(nix-store -l $path)" = FOO ]
