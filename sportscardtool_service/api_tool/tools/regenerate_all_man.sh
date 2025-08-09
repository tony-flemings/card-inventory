# regenerate_all_man.sh
#!/bin/bash
for cmd in fetch search-ebay pricechart; do
    help2man -N -n "$cmd command for api_tool" ./api_tool_wrapper.sh $cmd > docs/api_tool-$cmd.1
done
