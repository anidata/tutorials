@test "Check Bats is working" {
        run echo "It works!"
        [ "$status" -eq 0 ]
        [ "$output" = "It works!" ]
}
