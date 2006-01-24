# Adds the required directives at beginning
# of every class file, so that XPath queries
# can evaluate correctly
#  -Anant
import os

path = '../manual/en/reference/gtk'
xmlFiles = os.listdir(path)
print "Normalizing xml source files to comply with XPath requirements..."

# Counter to skip the CVS Folder
damnCVS = 0

# Loop over every xml file and add the lines
# I Suck at python, please optimize this script!
for filename in xmlFiles:
    if damnCVS:
        fpath = path+'/'+filename
        input = file(fpath, 'r')
        output = file('tmp', 'w')
        oneline = input.readline()
        output.write(oneline)
        output.write('<!DOCTYPE book [\n')
        output.write('<!ENTITY directory.examples "../../examples">\n')
        output.write('<!ENTITY directory.images "images"> ]>\n')
        nextline = input.readline()
        if nextline.strip() != "]>":
            output.write(nextline)
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
