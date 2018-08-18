[ -f "${BATS_TEST_DIRNAME}/Docker_census_data-fixtures.bash" ] && load "${BATS_TEST_DIRNAME}/Docker_census_data-fixtures.bash"

@test "Check data-engineering/Docker_census_data.ipynb runs" {
        run jupyter nbconvert --to notebook --execute "data-engineering/Docker_census_data.ipynb"
        (>&2 echo "$output")
        [ "$status" -eq 0 ]
}
