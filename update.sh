#!/bin/bash

# Variables for the new values
HTTP_URL="https://rpc.green.blockfabric.net/"
WS_URL="ws://rpc.green.blockfabric.net/"
NEW_CHAIN_ID="6941"

# New values for common-blockscout.env
NEW_DATABASE_URL="postgresql://greenindexeradmin:rH2MUmaAqnGDR0l7qmZpNO@green-blockchain-indexer-db.postgres.database.azure.com:5432/postgres"
NEW_POOL_SIZE="50"
NEW_HTTPS_USE_SSL="true"

# New values for common-frontend.env
NEW_API_HOST="22.171.27.199"
NEW_STATS_API_HOST="http://22.171.27.199:8080"
NEW_NETWORK_NAME="Green Chain"
NEW_NETWORK_SHORT_NAME="Green Chain"
NEW_CURRENCY_NAME="Green"
NEW_CURRENCY_SYMBOL="GREEN"
NEW_CURRENCY_DECIMALS="8"
NEW_APP_HOST="22.171.27.199"
NEW_VISUALIZE_API_HOST="http://22.171.27.199:8081"
NEW_IS_TESTNET="false"

# File paths
compose_file="docker-compose/docker-compose.yml"
blockscout_env_file="docker-compose/envs/common-blockscout.env"
frontend_env_file="docker-compose/envs/common-frontend.env"

# Replace lines in docker-compose.yml
sed -i '' "s|ETHEREUM_JSONRPC_HTTP_URL: http://host.docker.internal:8545/|ETHEREUM_JSONRPC_HTTP_URL: $HTTP_URL|" $compose_file
sed -i '' "s|ETHEREUM_JSONRPC_TRACE_URL: http://host.docker.internal:8545/|ETHEREUM_JSONRPC_TRACE_URL: $HTTP_URL|" $compose_file
sed -i '' "s|ETHEREUM_JSONRPC_WS_URL: ws://host.docker.internal:8545/|ETHEREUM_JSONRPC_WS_URL: $WS_URL|" $compose_file
sed -i '' "s|CHAIN_ID: '1337'|CHAIN_ID: '$NEW_CHAIN_ID'|" $compose_file

# Replace lines in common-blockscout.env
sed -i '' "s|ETHEREUM_JSONRPC_HTTP_URL=http://host.docker.internal:8545/|ETHEREUM_JSONRPC_HTTP_URL=$HTTP_URL|" $blockscout_env_file
sed -i '' "s|DATABASE_URL=postgresql://blockscout:ceWb1MeLBEeOIfk65gU8EjF8@db:5432/blockscout|DATABASE_URL=$NEW_DATABASE_URL|" $blockscout_env_file
sed -i '' "s|ETHEREUM_JSONRPC_TRACE_URL=http://host.docker.internal:8545/|ETHEREUM_JSONRPC_TRACE_URL=$HTTP_URL|" $blockscout_env_file
sed -i '' "s|POOL_SIZE=80|POOL_SIZE=$NEW_POOL_SIZE|" $blockscout_env_file
sed -i '' "s|ECTO_USE_SSL=false|ECTO_USE_SSL=$NEW_HTTPS_USE_SSL|" $blockscout_env_file

# Replace lines in common-frontend.env
sed -i '' "s|NEXT_PUBLIC_API_HOST=localhost|NEXT_PUBLIC_API_HOST=$NEW_API_HOST|" $frontend_env_file
sed -i '' "s|NEXT_PUBLIC_STATS_API_HOST=http://localhost:8080|NEXT_PUBLIC_STATS_API_HOST=$NEW_STATS_API_HOST|" $frontend_env_file
sed -i '' "s|NEXT_PUBLIC_NETWORK_NAME=Awesome chain|NEXT_PUBLIC_NETWORK_NAME=$NEW_NETWORK_NAME|" $frontend_env_file
sed -i '' "s|NEXT_PUBLIC_NETWORK_SHORT_NAME=Awesome chain|NEXT_PUBLIC_NETWORK_SHORT_NAME=$NEW_NETWORK_SHORT_NAME|" $frontend_env_file
sed -i '' "s|NEXT_PUBLIC_NETWORK_CURRENCY_NAME=Ether|NEXT_PUBLIC_NETWORK_CURRENCY_NAME=$NEW_CURRENCY_NAME|" $frontend_env_file
sed -i '' "s|NEXT_PUBLIC_NETWORK_CURRENCY_SYMBOL=ETH|NEXT_PUBLIC_NETWORK_CURRENCY_SYMBOL=$NEW_CURRENCY_SYMBOL|" $frontend_env_file
sed -i '' "s|NEXT_PUBLIC_NETWORK_CURRENCY_DECIMALS=18|NEXT_PUBLIC_NETWORK_CURRENCY_DECIMALS=$NEW_CURRENCY_DECIMALS|" $frontend_env_file
sed -i '' "s|NEXT_PUBLIC_APP_HOST=localhost|NEXT_PUBLIC_APP_HOST=$NEW_APP_HOST|" $frontend_env_file
sed -i '' "s|NEXT_PUBLIC_VISUALIZE_API_HOST=http://localhost:8081|NEXT_PUBLIC_VISUALIZE_API_HOST=$NEW_VISUALIZE_API_HOST|" $frontend_env_file
sed -i '' "s|NEXT_PUBLIC_IS_TESTNET=true|NEXT_PUBLIC_IS_TESTNET=$NEW_IS_TESTNET|" $frontend_env_file

echo "Replacement complete in $compose_file, $blockscout_env_file, and $frontend_env_file."

