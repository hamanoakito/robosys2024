#!/bin/bash
# SPDX-FileCopyrightText: 2024 Akito Hamano
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

###異常な入力###
out=$(echo -e  あ\\n い | ./OLS)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e \\n | ./OLS)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e 1 2 \\n 3 4 5 | ./OLS)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e 1 2 3 \\n 4 5 | ./OLS)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e 1 2 あ \\n 3 4 5 | ./OLS)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e 1 2 a \\n 3 4 5 | ./OLS)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e 1000000 2000000 3000000 \\n 4000000 5000000 6000000)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"


[ "${res}" = 0 ] && echo OK
exit "$res"
