
NAME=($(find / -name "docker-compose.*ml" | awk -F / '{print $(NF-1)}'))
path=($(find / -name "docker-compose.*ml" -exec dirname {} \; ))

#NAME: search compose file and check stack service directory
#path: find stack directory path

echo "==========================="
for (( i=0; i < ${#NAME[@]}; i++ ))
do
        echo "service name : " ${NAME[$i]}
        echo "Disk Usage : " $(du ${path[$i]} -sh | awk '{print $1}')
        tree -L 2 -d ${path[$i]} | sed '$ d'
        echo "==========================="


done

#script info: show stack name
#             show stack directory usage disk size
#             show stack directory tree