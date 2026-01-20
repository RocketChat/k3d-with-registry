PATH_TO_REGISTRIES_YAML=${PATH_TO_REGISTRIES_YAML:-$HOME/git/k3d-with-registry/registries.yaml} #change this for your path
K3D_PATH=${K3D_PATH:-$(which k3d)}
__k3d_with_registry() {
	if [[ $* =~ ^cluster\ +create\ + ]]; then
		${K3D_PATH} "$@" --network registry-proxy-net --registry-config "$PATH_TO_REGISTRIES_YAML"
	else
		${K3D_PATH} "$@"
	fi
}

export -f __k3d_with_registry

alias k3d=__k3d_with_registry