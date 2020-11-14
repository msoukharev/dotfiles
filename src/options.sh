options() {
    for i in $@; do
        grep -q "-" <<< $i || grep -q "--" <<< $i && echo $i
    done
}

positionals() {
    for i in $@; do
        grep -q "-" <<< $i || grep -q "--" <<< $i || echo $i
    done
}