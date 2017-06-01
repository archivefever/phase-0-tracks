# Git Definitions
CHANGE******
**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
Version control is a system developers use to track changes of files such that specific versions of the files can be recalled later wherever a save point was created. For instance, if errors are detected in a project, the files can be rolled back to a point before the errors were entered; in addition, version control allows multiple developers to work on a project simultaneously while keeping their work separate and available for review before being committed to the master.
* What is a branch and why would you use one?
In version control a branch is a copy of a file directory where changes can be made without altering the original files. Branching might be used by different developers to make parallel changes to files or just to focus on making modifications to one particular feature of a project.
* What is a commit? What makes a good commit message?
A commit creates a save point for the files in a git repository. The repository can be rolled back to the save point at any time after the commit. A good commit message makes a clear and meaningful statement about what changes have been made to what files in that particular branch.
* What is a merge conflict?
A merge conflict is when git notices a discrepancy between changes made to the same line of the same file, or when one user makes changes to a file and another deletes the same file. Git then requests your help to determine which changes are finalized in the merge.