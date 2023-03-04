#!/bin/bash
# Script to help with file attributes

# Make append only
# sudo chattr +a FILENAME

lsattr FILENAME

# Make immutable
# sudo chattr +i FILENAME

# To remove (or a)
# sudo chattr -i FILENAME
