export ORIGINAL_PATH=$PATH

function add_carwow_path() {
  export PATH=$ORIGINAL_PATH:~/projects/carwow/dev-environment/bin
}

function remove_carwow_path() {
  export PATH=$ORIGINAL_PATH
}

add_carwow_path

