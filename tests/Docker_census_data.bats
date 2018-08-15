[ -z "Docker_census_data-setup.bash" ] && load "Docker_census_data-fixtures"

@test "Check data-engineering/Docker_census_data.ipynb runs" {
        run jupyter nbconvert --to notebook --execute "data-engineering/Docker_census_data.ipynb"
        (>&2 echo "$output")
        [ "$status" -eq 0 ]
}
