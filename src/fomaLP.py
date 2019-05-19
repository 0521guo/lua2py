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
	SIth[i] = e.replace("function","def").replace("io.read","input ")
	if ")" in e and "def" in SIth[i - 2]:
		SIth[i] = e[0:e.rindex(")")] + '):'
	i += 1
thFT = " ".join(SIth)
thFT = thFT.replace("end"," ")
thFT = thFT.replace("end\n", " ")
newFile.write(thFT)
newFile.close()
