#!/bin/bash
if test "${CH_NORM_HOSTNAME}" = "yes"; then
    sed -i -e "s/norminette.jgengo.fr/norminette.42network.org/" ~/.norminette/config.conf
fi

# a common pattern: https://stackoverflow.com/a/60487804/5475667
exec "$@"
