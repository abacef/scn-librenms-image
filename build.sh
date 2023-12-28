if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker to continue."
    exit 1
fi

build_command="docker build . -t scn-librenms"
result=$($build_command 2>&1)

if [ $? -ne 0 ]; then
	if [[ "$result" == *"permission denied"* ]]; then
    		sudo $build_command || { echo "Unable to execute docker build command even after elevating permissions" >&2; exit 1; }
	else
		echo "unable to execute docker build command '$result'"
	fi
else
    echo "✅ Docker build successful."
fi

