RESPONSES=("Yes" "No" "Maybe")
N=$((RANDOM%3+1))

echo "Ask a yes or no question to find your fortune:"

read QUESTION

echo $N

echo "${RESPONSES[$N]}"
