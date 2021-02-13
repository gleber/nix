# Tests

Use

    make tests/foo-bar.sh.test

to execute a single test.

To add a new test, extend `nix_tests` list in `local.mk` with the name of newly
added sh script.
