#!/bin/bash
rtDir={1:-.}
force={2:-z}
if [ "$force" != "y" ]; then
	echo 'really rename the following?:'
	while read -r line;
	do 
		echo "   mv \"$line\" \"${line//[ ()@$]/_}\""
	done < <(find . | grep -v ".git/" | grep " "; find . | grep -v ".git/" | grep @)
	read  -n 1 -p "Do you really want to rename all those files? (y/n) " force
	echo
fi
if [ "$force" == "y" ]; then
	while read -r line;
	do 
		mv "$line" "${line//[ ()@$]/_}"
	done < <(find . | grep -v ".git/" | grep " "; find . | grep -v ".git/" | grep @)
fi

