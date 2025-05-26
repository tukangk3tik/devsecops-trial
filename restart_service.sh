
IFS=',' read -ra FEATURES <<< "$KEYS"
for feature in "${FEATURES[@]}"; do
    echo "Processing $feature..."
    echo "NODE_ENV=$ENV_VAR nohup node '$WORKING_DIRECTORY/dist/$feature.server.js' >> ./logs/$feature.log &"
done
