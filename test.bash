#!/bin/bash
# SPDX-FileCopyrightText: 2024 Akito Hamano
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

###正常な入力###
output="xの平均:2.0   yの平均:5.0   x*yの平均:10.67   xの二乗の平均:4.67   xの平均の二>乗:4.0\n最小二乗法の式は y = 1.0x + 3.0"
out=$(echo -e 1 2 3\\n4 5 6 | ./OLS)
[ "${out}" = "$(printf "$output")"] || ng $LINENO

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
