cat LogA.txt | sed s/INCORRECT_PASSWORD/ACCESS_DENIED/ > Update1_Combined_Access_logs.txt
cat Update1_Combined_Access_logs.txt | awk -F" " '{print $4, $6}' > Update2_Combined_Access_logs.txt

