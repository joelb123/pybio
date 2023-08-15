#!/bin/bash
make setup_tests -j8 1>/dev/null
tests=$(cat tmpfiles.txt | tr " " "\n")
n_failed=0 n_successes=0
rm -f failed.txt
echo "running tests"
start_time="$(date -u +%s)"
for test_exe in $tests; do
	echo -n "  ${test_exe}..." $(./$test_exe 2>/dev/null)
	if [ $? -eq 0 ]; then 
		echo "OK" 
		((n_successes=n_successes+1))
	else
		echo -e "\e[31m\e[1mfailed\e[0m" echo "${test_exe}" >> failed.txt
		((n_failed=n_failed+1))
	fi
done
end_time="$(date -u +%s)"
elapsed="$(($end_time-$start_time))"
echo "Results: ${n_successes} successes, ${n_failed} failures in ${elapsed} s"
rm -f tmpfiles.txt
if [ $n_failed -gt 0 ]; then
	echo "Failed tests:"
	cat failed.txt
	rm -f failed.txt 
	exit 1
fi 
