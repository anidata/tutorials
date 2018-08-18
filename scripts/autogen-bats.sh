#!/bin/bash
TEST_TEMPLATE=$(cat << 'EOD'
[ -f "${BATS_TEST_DIRNAME}/%%NAME%%-fixtures.bash" ] && load "${BATS_TEST_DIRNAME}/%%NAME%%-fixtures.bash"

@test "Check %%NOTEBOOK%% runs" {
        run jupyter nbconvert --to notebook --execute "%%NOTEBOOK%%"
        (>&2 echo "$output")
        [ "$status" -eq 0 ]
}
EOD
)

for notebook in **/*.ipynb; do
        if [ "$(echo "${notebook}" | rev | cut -f -2 -d '.' | rev)" \
                        == "nbconvert.ipynb" ]; then
                continue
        fi
        name=$(basename "${notebook}" | rev | cut -f 2- -d '.' | rev)
        echo "${TEST_TEMPLATE}" \
                | sed -e "s@%%NOTEBOOK%%@${notebook}@g" \
                        -e "s@%%NAME%%@${name}@g" \
                > "tests/${name}.bats"
done
