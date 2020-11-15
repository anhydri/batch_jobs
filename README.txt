HOW TO USE:

Before you begin with running the scripts, you need to move the scripts into the path which you have an access from everywhere. 
Let's do this together. 

    Create a new folder in your home directory: 
        $ mkdir ~/bin/
        $ cd ~/bin
        $ pwd 
        /home/565/anh/bin 
    Copy this path 

    In your home directory (access with $ cd), run command: vim .bashrc  
    In .bashrc file, go to the end and type in: (you insert the path you copied here!)
        export PATH=/home/565/anh/bin:$PATH
    Save and close .bashrc file
 
    To activate the .bashrc file, there are two ways:
    1 - Log out of the cluster and log in again
    2 - Run this command: . ~/.bashrc (With this, you don't need to log in and out.)
    If the second method does not work, do the first. 

    Move the scripts, chktime.sh and subjobs.sh and getPath.py and getName.py, into bin/ folder. 
    Then, run this commands: 
        $ chmod 755 chktime.sh 
        $ chmod 755 subjobs.sh 
        $ chmod 755 getPath.py
        $ chmod 755 getName.py
    Now you're good to continue :)

Next, you need a file called "jobs.txt" in your directory, from where you want to run the script chktime.sh. 
In jobs.txt, put a name list of your job files with their absolute path.

For examples:
    $ cat jobs.txt
    /home/anh/sn29/molecule/benzene/job-1.job
    /home/anh/sn29/molecule/benzene/job-2.job
    /home/anh/sn29/molecule/aspirin/job-1.job


Use command readlink -f *job to obtain the absolute paths of the jobb files.


* !!! Important: "jobs.txt" name is not allowed to change. It stays jobs.txt, and not e.g. coms.txt or anything else.
                 The list of jobs in this file can be changed, i.e. alcohol.job or alcohol.com
                 depending on which calculations you want to submit.
                 But the name of jobs in this file has to be the same as the name of jobs in your directory !!!*

Now you have jobs.txt. Let's move on!

You might want to change the time set in chktime.sh script. 
Otherwise, the script will run with the default timei everyday; 08:00:00 and 20:00:00. 

If you are now happy with the time set up, let's run the script. 

    In the working directory, type in this command:
        $ screen 
    # screen is a Unix utility which allows you to have the job running on background without connecting to the server. 
    Press enter 
    Run script: 
        $ ./chktime.sh 

    Now you can close the terminal, log out and enjoy your holiday. 

If you want to check it out, log in to your supercomputer with ssh.

    Type in:
        $ screen -ls
        This command shows the list of your "screen" sessions.
    Type in:
        $ screen -r [[pid.]tty[.host]]
        This command let you log in one of your screen session.
        [[pid.]tty[.host]] can be copied from the list of the "screen" sessions by running the command "screen -ls"

Happy submmitting jobs!
