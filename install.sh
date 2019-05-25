#!/bin/bash
clear
read -p "you want run the installer? [yes/no]: " per
if [[  "$per" == "yes" ]] ; then
{
clear
cwd=$(pwd)
cd /home/$USER
if [ ! -d "bin" ] ; then
mkdir "bin"
fi
export PATH=$PATH:/home/$USER/bin
cp ${cwd}/src/formaPL.py /home/$USER/bin/.formaPL.py
cd /home/$USER/bin
if [ ! -f "l2p" ] ; then
touch l2p
else
rm l2p
fi
echo "#!/bin/bash" >> l2p
echo "if [[ \"\${1}\" == \"-h\" ]] ; then" >> l2p
echo "echo \"Lua2Python v1.0.0\"" >> l2p
echo "echo -e \"\e[93mORDERS
l2p -h [get help]
l2p -lp [pasing lua file to python file] example: \$ l2p -lp <file>.lua <name new file>.py
l2p -v [show version]
l2p -u [unistall]
l2p -c [credits]\"" >> l2p
echo "elif [[ \"\${1}\" == \"-v\" ]] ; then" >> l2p
echo "echo v1.0.0" >> l2p
echo "elif [[ \"\${1}\" == \"-c\" ]] ; then
echo \"zje - 2019\"
echo -e '\e]8;;https://github.com/zje-dev\a github \e]8;;\a'" >> l2p
echo "elif [[ \"\${1}\" == \"-u\" ]] ; then
rm l2p
#elif [[ \"\${1}\" == \"-lp\" ]] ; then
#if [[ \"\${2}\" != \"\" ]] && [[ \"\${3}\" != \"\" ]]; then
#files exists
#cwd=\$(pwd)
#touch \${3}
#cd /home/$USER/bin
#python3 fomaLP.py \${2} \${3} \${cwd}
echo \"ready\"
#fi" >> l2p
echo "
elif [[ \"\${1}\" == \"-pl\" ]] ; then
if [[ \"\${2}\" != \"\" ]] && [[ \"\${3}\" != \"\" ]]; then
cwd=\$(pwd)
touch \${3}
cd /home/$USER/bin
python3 .formaPL.py \${2} \${3} \${cwd}
echo \"ready\"
else
echo -e \"\e[91mERROR files don't found\"
fi" >> l2p
echo "else" >> l2p
echo "echo -e \"\e[91mERROR order don't found\"" >> l2p
echo "fi" >> l2p
echo "#EOF" >> l2p
chmod u+x l2p
} || {
echo "ERROR: ???"
}
echo "full installed"
else
echo "well"
sleep 1
exit
fi
