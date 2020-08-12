echo "Enter your lucky number:"; read N;

if [ $N -eq 101 ]; then echo "You got 1st prize";
elif [ $N -eq 510 ]; then echo "You got 2nd prize";
elif [ $N -eq 999 ]; then echo "You got 3rd prize";
else echo "No prize for you";
fi
