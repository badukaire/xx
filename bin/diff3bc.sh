#!/bin/sh

# Configure your favorite diff3/merge program here.
DIFF3=bcompare

# Subversion provides the paths we need as the ninth, tenth, and eleventh
# parameters.
LEFT=$6
RIGHT=$7

# Call the merge command (change the following line to make sense for
# your merge program).
$DIFF3 $LEFT $RIGHT
RET=$?

# After performing the merge, this script needs to print the contents
# of the merged file to stdout.  Do that in whatever way you see fit.
# Return an errorcode of 0 on successful merge, 1 if unresolved conflicts
# remain in the result.  Any other errorcode will be treated as fatal.

exit $RET
