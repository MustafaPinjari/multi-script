#!/bin/bash
#!/bin/bash

# wait for internet
until ping -c 1 github.com &>/dev/null
do
  sleep 10
done


FILE="activity.log"

for i in {1..10}
do
  echo "Activity update $i at $(date)" >> $FILE
  git add $FILE
  git commit -m "chore: activity update $i"
done

git push origin main
