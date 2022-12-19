i=$1
login="$(cat rank.txt | awk  '{print $2}' | head -n $1 |tail -1)"
wget https://cdn.intra.42.fr/users/$login.jpg -O medium_$login.jpg
 
