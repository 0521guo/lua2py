import sys
import os
os.chdir(os.path.expanduser("~"))
os.getcwd()
path = sys.argv[3]
path = path.replace(sys.argv[3][0:10], '')
os.chdir(path)
os.getcwd()
oriFile = open(sys.argv[1],"r").read()
newFile = open(sys.argv[2],"w")
thSI = []
i = 0
for c in oriFile:
	thSI.append(oriFile[i])
	i += 1
i=0
SIth = [""]
for c in thSI:
	SIth[i] += c
	if c == ' ' or c == '\n' or c == "\r":
		SIth.append("")
		i += 1
i=0
for e in SIth:
	SIth[i] = e.replace("def","function").replace("input ","io.read")
	if ")" in e and "function" in SIth[i - 2]:
		SIth[i] = e[0:e.rindex(":")] + ' '
i = 0

#for para endPoss para hacer los end
thFT = " ".join(SIth)
newFile.write(thFT)
newFile.close()
