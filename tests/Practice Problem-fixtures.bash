setup() {
        # Copy solutions to data for testing
        mkdir -p ${BATS_TEST_DIRNAME}/../data-engineering/data
        cp -r ${BATS_TEST_DIRNAME}/../data-engineering/solutions/* \
                ${BATS_TEST_DIRNAME}/../data-engineering/data
}
