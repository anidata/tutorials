[ -f "${BATS_TEST_DIRNAME}/Docker on GCloud-fixtures.bash" ] && load "${BATS_TEST_DIRNAME}/Docker on GCloud-fixtures.bash"

@test "Check data-engineering/Docker on GCloud.ipynb runs" {
        run jupyter nbconvert --to notebook --execute "data-engineering/Docker on GCloud.ipynb"
        (>&2 echo "$output")
        [ "$status" -eq 0 ]
}
