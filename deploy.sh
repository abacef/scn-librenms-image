set -e

if command -v socker &> /dev/null; then
    echo "✅ Docker is installed."
else
    echo "❌ Docker is not installied. Please install docker to continue. I am too lazy to write the commands to install docker here" >&2
    exit 1
fi


