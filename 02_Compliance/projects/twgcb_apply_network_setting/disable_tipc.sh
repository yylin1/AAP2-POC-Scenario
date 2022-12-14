#/bin/bash

# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if LC_ALL=C grep -q -m 1 "^install tipc" /etc/modprobe.d/tipc.conf ; then

        sed -i 's#^install tipc.*#install tipc /bin/true#g' /etc/modprobe.d/tipc.conf
else
        echo -e "\n# Disable per security requirements" >> /etc/modprobe.d/tipc.conf
        echo "install tipc /bin/true" >> /etc/modprobe.d/tipc.conf
fi

if ! LC_ALL=C grep -q -m 1 "^blacklist tipc$" /etc/modprobe.d/tipc.conf ; then
        echo "blacklist tipc" >> /etc/modprobe.d/tipc.conf
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi