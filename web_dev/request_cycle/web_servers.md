
Linux design philosophy
* Each command is farily small and performs a specific task.
* Portability is privileged over efficiency.
* Data is stored in flat text files.
* An emphasis on software leverage, which is relying on the good code that has been written before and never unnecessarily rewriting code.
* Both portability and software leverage are maximized with shell scripts.
* Every command on the command line is actually a program that filters the data stream, make some change to it, and then sends the new, changed data stream to the output.

A virtual private server (VPS) is a portion of memory reserved in a remote computer that has, in and of itself, its own operating system that you (as the user) control remotely.

Advantages of a VPS:
1. Less expensive than using a physical server
2. VPS have higher performance than a shared server
3. VPS are easily scalable
4. If you break a VPS with a fatal error, it only destroys that localized system -- segregation.
5. The user can select a range of memory, storage, etc.

Disadvantages

1. There are often maintenance issues.
2. Host often does not provide the correct allocation of resources; this can cut into efficiency.
3. Difficult to manage VPS during periods of intense traffic.
4. At the higher end, there can be cost issues.

Running a system as root is dangerous because root is the only "user" with the degree of access that can actually kill a system. Other users do not have the necessary permissions.