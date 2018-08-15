[ -z "Docker_Get_started-setup.bash" ] && load "Docker_Get_started-fixtures"

@test "Check data-engineering/Docker_Get_started.ipynb runs" {
        run jupyter nbconvert --to notebook --execute "data-engineering/Docker_Get_started.ipynb"
        (>&2 echo "$output")
        [ "$status" -eq 0 ]
}
