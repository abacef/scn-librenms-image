if command -v docker &> /dev/null; then
    echo "✅ Docker is installed."
else
    echo "❌ Docker is not installied. Please install docker to continue. I am too lazy to write the commands to install docker here" >&2
    exit 1
fi

build_command="docker build . -t scn-librenms"
permission_denied_string="permission denied"

result1=$($build_command 2>&1 >/dev/null)

if [ $? -ne 0 ] && [[ "$result1" == *"$permission_denied_string"* ]]; then
    eval "sudo $build_command"
else
    echo "Unable to execute docker build command: '$result1'"
fi


