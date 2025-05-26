tput reset
services=('gateway' 'eligibility' 'deduct' 'batch' 'coupon' 'donation' 'inject_point' 'location' 'merchandise' 'notification' 'outbound' 'refund' 'sftp' 'transaction_master' 'voucher')
service_name=$1
no_cluster=$2
now=$(date +"%Y%m%d")
current_dir=$(pwd)

        tput reset
        ps -aux | grep -E "${current_dir}/dist/[a-z]*.server.js"
        echo "----------------------------------"
        echo $service_name
        GPIDS=()
        while read line; do
                if [ ! -z "$line" ]
                then
                       echo "Killing $line"
                       kill -2 "$line"

                        echo $'\e[1;31m'Delete cache$'\e[0m'
                        rm "${current_dir}/dist/${service_name}.server.js"
                fi
        done < <( ps -aux | grep -E "[0-9] node ${current_dir}/dist/${service_name}.server.js" |  awk '{ print $2 }' )

        # will execute in Gitlab
        echo $'\e[1;33m'Building ${service_name} service...$'\e[0m'
        NODE_ENV=preprod nest build "${service_name}"

        # will execute in Ansible
        echo "Restarting ${service_name} services..."
        NODE_ENV=preprod NODE_CLUSTER=$no_cluster nohup node "${current_dir}/dist/${service_name}.server.js" >> ./logs/${service_name}.log &

        echo $'\e[1;32m'Done$'\e[0m'

echo "Services ----------------------------------"
ps -aux | grep -E "${current_dir}/dist/[a-z]*.server.js"