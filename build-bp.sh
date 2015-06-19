#!/bin/bash

#    Resurrection Remix Compilation Script
#
#    Copyright (C) 2014 Shubhang Rathore
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


# No scrollback buffer
echo -e '\0033\0143'



# Get intial time of script startup
res1=$(date +%s.%N)



# Specify colors for shell
red='tput setaf 1'              # red
green='tput setaf 2'            # green
yellow='tput setaf 3'           # yellow
blue='tput setaf 4'             # blue
violet='tput setaf 5'           # violet
cyan='tput setaf 6'             # cyan
white='tput setaf 7'            # white
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Bold red
bldgrn=${txtbld}$(tput setaf 2) # Bold green
bldblu=${txtbld}$(tput setaf 4) # Bold blue
bldcya=${txtbld}$(tput setaf 6) # Bold cyan
normal='tput sgr0'


tput bold
tput setaf 1
clear
echo -e ""
echo -e "BLISS POP"
echo -e "Patrick's Device list"
echo -e ""
echo -e ""
echo -e ""

sleep 3s

# Clear terminal
clear

# Confirm 'make clean'
echo -e "\n\n${bldgrn}  Do you want to make clean?\n"
echo ""
echo -e "${bldblu}  1. Yes"
echo -e "${bldblu}  2. No"
echo ""
echo ""
$normal
read askClean

# Devices to build
echo -e "\n\n${bldgrn}  Do you want to build all devices?\n"
echo ""
echo -e "${bldblu}  1. Yes"
echo -e "${bldblu}  2. No"
echo ""
echo ""
$normal
read askdevices

echo ""
echo ""
if [ "$askClean" == "1" ]
then
    echo -e "${bldred}  Compilation will continue after cleaning previous build files... "
else
    echo -e "${bldred}  ROM will be compiled without cleaning previous build files... "
fi
echo ""
echo ""

echo ""
echo ""
if [ "$askdevices" == "1" ]
then
    echo -e "${bldred}  Will build Shamu, vs985, flo, deb, titan and Falcon... "
else
    echo -e "${bldred}  Will be just Shamu... "
fi
echo ""
echo ""


sleep 2s
# Clear terminal
clear


if [ "$askClean" == "1" ]
then
	echo ""
	echo ""
	echo -e "${bldgrn}  Cleaning before starting build... "
	echo ""
	echo ""
	$normal
	make clobber
fi

if [ "$askdevices" == "1" ]
then
	echo ""
	echo ""
	echo -e "${bldgrn}  Building all devices Now... "
	echo ""
	echo ""
	$normal
	. build/envsetup.sh && brunch shamu && cp out/target/product/shamu/BlissPop* ~/blisshost && cp out/target/product/shamu/system/etc/CHANGELOG-bliss.txt ~/log && cp out/target/product/shamu/ota3.xml ~/blisshost && . build/envsetup.sh && brunch vs985 && cp out/target/product/vs985/BlissPop* /home/web-bliss/BlissPop/Official/vs985 && cp out/target/product/vs985/ota3.xml /home/web-bliss/BlissPop/Official/vs985 && . build/envsetup.sh && brunch flo && cp out/target/product/flo/BlissPop* /home/web-bliss/BlissPop/Official/flo && cp out/target/product/flo/ota3.xml /home/web-bliss/BlissPop/Official/flo && . build/envsetup.sh && brunch deb && cp out/target/product/deb/BlissPop* /home/web-bliss/BlissPop/Official/deb && cp out/target/product/deb/ota3.xml /home/web-bliss/BlissPop/Official/deb && . build/envsetup.sh && brunch titan && cp out/target/product/titan/BlissPop* /home/web-bliss/BlissPop/Official/titan && cp out/target/product/titan/ota3.xml /home/web-bliss/BlissPop/Official/titan && . build/envsetup.sh && brunch falcon && cp out/target/product/falcon/BlissPop* /home/web-bliss/BlissPop/Official/falcon && cp out/target/product/falcon/ota3.xml /home/web-bliss/BlissPop/Official/falcon
else 
        echo ""
        echo ""
        echo -e "${bldgrn}  Building Shamu Now... "
        echo ""
        echo""
        $normal
        . build/envsetup.sh && brunch shamu && cp out/target/product/shamu/BlissPop* ~/blisshost && cp out/target/product/shamu/system/etc/CHANGELOG-bliss.txt ~/log && cp out/target/product/shamu/ota3.xml ~/blisshost

# Clear terminal
clear


# Compilation complete
tput bold
tput setaf 1
clear
echo -e ""
echo -e "Device have all been built and uploaded"
echo -e ""
echo -e ""


# Switch terminal back to normal
$normal
