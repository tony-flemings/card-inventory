# api_tool_wrapper.sh
#!/bin/bash

case "$1" in
    fetch)
        python3 api_tool/cli.py fetch --help
        ;;
    search-ebay)
        python3 api_tool/cli.py search-ebay --help
        ;;
    pricechart)
        python3 api_tool/cli.py pricechart --help
        ;;
    *)
        python3 api_tool/cli.py --help
        ;;
esac
