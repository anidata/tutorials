[ -z "Practice Problem-setup.bash" ] && load "Practice Problem-fixtures"

@test "Check data-engineering/Practice Problem.ipynb runs" {
        run jupyter nbconvert --to notebook --execute "data-engineering/Practice Problem.ipynb"
        (>&2 echo "$output")
        [ "$status" -eq 0 ]
}
