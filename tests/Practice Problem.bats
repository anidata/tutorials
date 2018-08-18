[ -f "${BATS_TEST_DIRNAME}/Practice Problem-fixtures.bash" ] && load "${BATS_TEST_DIRNAME}/Practice Problem-fixtures.bash"

@test "Check data-engineering/Practice Problem.ipynb runs" {
        run jupyter nbconvert --to notebook --execute "data-engineering/Practice Problem.ipynb"
        (>&2 echo "$output")
        [ "$status" -eq 0 ]
}
