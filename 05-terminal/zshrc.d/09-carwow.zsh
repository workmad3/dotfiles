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

function carwow_start_all() {
  add_carwow_path
  carwow start sites
  carwow start flatmin
  carwow start vehicle_lookup_app
  carwow start kafka
  carwow start kafka-consumer flatmin

  cp ~/sidekiq-dev-procfiles/flatmin ~/projects/carwow/flatmin/Procfile.dev
  carwow start sidekiq-worker flatmin

  cp ~/sidekiq-dev-procfiles/quotes_site ~/projects/carwow/quotes_site/Procfile.dev
  carwow start sidekiq-worker quotes_site
}
