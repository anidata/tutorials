[ -f "${BATS_TEST_DIRNAME}/Docker_Get_started-fixtures.bash" ] && load "${BATS_TEST_DIRNAME}/Docker_Get_started-fixtures.bash"

@test "Check data-engineering/Docker_Get_started.ipynb runs" {
        run jupyter nbconvert --to notebook --execute "data-engineering/Docker_Get_started.ipynb"
        (>&2 echo "$output")
        [ "$status" -eq 0 ]
}
