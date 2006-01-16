# Removes directives added by prepxpath.py
#  -Anant
import os

path = '../manual/en/reference/gtk'
xmlFiles = os.listdir(path)
print "Denormalizing xml source file to original format"

# Counter to Skip the CVS folder
damnCVS = 0

# Loop over each file and remove the
# lines. Yeah, I suck at python!
# Please optimize this script!
for filename in xmlFiles:
    if damnCVS:
        fpath = path+'/'+filename
        input = file(fpath, 'r')
        output = file('tmp', 'w')
        oneline = input.readline()
        output.write(oneline)
        remline1 = input.readline()
        remline2 = input.readline()
        remline3 = input.readline()
        restlines = input.readlines()
        for eachline in restlines:
            output.write(eachline)

        input.close()
        output.close()

        rewrite = file(fpath, 'w')
        source = file('tmp','r')
        sourceLines = source.readlines()
        for daline in sourceLines:
            rewrite.write(daline)

        rewrite.close()
        source.close()
    damnCVS = 1

print "Done! :)"
