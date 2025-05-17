export ORIGINAL_PATH=$PATH

function add_carwow_path() {
  export PATH=$ORIGINAL_PATH:~/projects/carwow/dev-environment/bin
}

function remove_carwow_path() {
  export PATH=$ORIGINAL_PATH
}

add_carwow_path

function rebuild_indexes() {
  declare -a INDEXES=("unbuilt_vehicles" "vehicles" "cheapest_deals" "deals")

  for i in "${INDEXES[@]}"; do
    rails es:$i:dev_index
  done
}
